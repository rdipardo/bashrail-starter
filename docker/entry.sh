#!/usr/bin/env bash
set -e

# https://github.com/panubo/docker-postfix
echo "nameserver 10.4.1.200" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

fil=/etc/hosts
cp $fil $fil$(date +"__%Y.%m.%d_%H.%M.%S")
tee  $fil <<- 'HEREDOC'
127.0.0.1 localhost
HEREDOC
echo "127.0.1.1 bashrail.local" >>/etc/hosts

if ! grep 'bashrail.local' /etc/mail/sendmail.mc ; then
  sed -i "/MAILER_DEF.*/i define(\`confDOMAIN_NAME', \`bashrail.local')dnl" /etc/mail/sendmail.mc
fi

if ! grep '/etc/mail/tls/starttls.m4' /etc/mail/sendmail.mc ; then
  echo "include(\`/etc/mail/tls/starttls.m4')dnl" >> /etc/mail/sendmail.mc
fi

make -C /etc/mail
sendmailconfig
/etc/init.d/sendmail reload
service postfix restart

# https://stackoverflow.com/a/44772662
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

bundle exec rails db:setup 2>/dev/null || bundle exec rails db:migrate

echo "Running command $*"
exec bundle exec "$@"
