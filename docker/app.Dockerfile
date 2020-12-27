FROM ruby:2.6.6-slim-buster

RUN echo "alias ll='ls -la'" >> ~/.bashrc ; chmod ugo+rw  ~/.bashrc \
  && echo "alias psg='ps -ef|grep '" >> ~/.bashrc \
  && echo "postfix postfix/mailname string $(hostname -f)" | debconf-set-selections \
  && echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN apt-get update -qq && apt-get install -y npm build-essential libpq-dev postfix

# !!!
# `postfix` must be installed BEFORE the `sendmail` utilities:
# https://www.linuxquestions.org/questions/slackware-14/okay-to-have-sendmail-and-postfix-both-installed-4175549843/#post5400907
# !!!
RUN apt-get install -y sasl2-bin sendmail sendmail-bin sendmail-cf m4 mailutils
RUN npm i -g yarn

RUN line=$(head -n 1 /etc/hosts) \
  && line2=$(echo $line | awk '{print $2}')

COPY Gemfile Gemfile.lock /app/
COPY docker/entry.sh /app

WORKDIR /app
RUN gem install bundler -v "~>2.0" && bundle install --jobs 8 --retry 3
RUN  chmod +x /app/entry.sh
ENTRYPOINT ["/app/docker/entry.sh"]
