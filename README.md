## Bashrail Starter Template

[![Build Status][travis-badge]][travis-status]

Originally forked from an [older demonstration][] of [@dgleba][]'s [Bashrail][] utility.

Go [**here**](https://bashrail-starter.herokuapp.com/) to see a live demo of a production deployment.

### Includes

- PostgreSQL driver setup. You can either [use a local instance][] or [connect a Docker image][]
- Docker and Docker Compose scripts. Containers are mostly deployment-ready, but [some configuration][] is required
- A custom web font added to the [Rails asset pipeline][]
- [Travis CI pipeline][]  with automated [Heroku][] deployment

<h4 style="color:#AF002A">Important</h4>

Don't forget to [generate a `SECRET_KEY_BASE`][] token before deploying in production mode.

For most environments, it should be as simple as running:

    EDITOR=vim RAILS_ENV=production bundle exec rails credentials:edit

and saving the generated file as `config/secrets.yml`.

If successful, the output will resemble the following:

    Adding config/master.key to store the master encryption key: <xxxxxxxxxxxxxx>

    Save this in a password manager your team can access.

    If you lose the key, no one, including you, can access anything encrypted with it.

---
#### Additional Setup (*optional*)

##### From the original [index.html.erb](https://github.com/dgleba/brail484b46/blob/master/app/views/home/index.html.erb)

###### JWT

The example below is how to make a curl HTTP request with the proper authentication headers.

Be sure to actually use a working route and not `http://localhost:3001/products.json`

```erb
<% if user_signed_in? %>
  curl -i -X  GET --header 'Authorization: Bearer <%= JWTWrapper.encode({ user_id: current_user.id }) %>' 'http://localhost:3001/products.json'
<% end %>
```

---
##### From the original [README](https://github.com/dgleba/brail484b46/blob/master/README.md)

This project was generated by bashrail. See the files in [docs/generatedby][] for more info.

Also see https://github.com/dgleba/bashrail/tree/master/docsbr

If you clone this repo, You may need to:

Check [ db/../..seeds*.rb](db/seeds.rb) for username and password.

---
### License

Any copyright is dedicated to the Public Domain.
For more information, please refer to https://unlicense.org.


[Bashrail]: https://github.com/dgleba/bashrail
[@dgleba]: https://github.com/dgleba
[older demonstration]: https://github.com/dgleba/brail484b46/
[docs/generatedby]: https://github.com/dgleba/brail484b46/tree/master/docs/generatedby
[Travis CI]: https://travis-ci.com
[Heroku]: https://devcenter.heroku.com/categories/ruby-support
[use a local instance]: config/database-example.yml
[connect a Docker image]: docker/postgres.env
[some configuration]: docker/app.env
[Rails asset pipeline]: https://gist.github.com/anotheruiguy/7379570
[generate a `SECRET_KEY_BASE`]: https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/
[Travis CI pipeline]: https://docs.travis-ci.com/user/deployment/heroku/
[travis-status]: https://travis-ci.com/rdipardo/bashrail-starter
[travis-badge]: https://travis-ci.com/rdipardo/bashrail-starter.svg?branch=main
