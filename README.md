# FB11::Demo

This small demo app was made to show off FB11's features and also as a test bed
against which changes to FB11 could be exhibited without the obfuscating content
of client work.

## Creation

This app was created with the following simple commands:

    dzil new -P FB11 FB11::Demo
    cd FB11-Demo
    dzil add -P FB11 -p FB11X FB11::Demo::FB11X::Admin

The first line minted the main application, and the third added an FB11X
component. It is not strictly necessary to call this FB11X, but the convention
is helpful.

Obviously this only created a skeleton; the rest of the work was done manually.

# Running

You can plackup the PSGI file and go nuts. Remember to install dependencies:
there's a `cpanfile` for that.

    cpanm --installdeps .
    plackup -I lib -p 12345 fb11-demo.psgi

It's a Catalyst app so you can configure it yourself. You'll need a postgres
database. See below for database setup.

## Docker

I have dockerised this application. There is a Makefile here. You should use
that.

    make docker
    docker-compose up -d

You should also copy the `docker-compose.override.yml.example` to
`docker-compose.override.yml` and amend it to suit your needs. Your most likely
use of this is to add a port to localhost that will serve your app.

To serve it on `localhost:12345`:

    ...
    app:
      ports:
        - "12345:5000"

Remember to run `docker-compose up -d` whenever you make changes to this YAML
file. Remember not to make changes to the base YAML file.

### Developing

You can make changes to the checked-out code using volumes and environment
variables. The example `docker-compose.override.yml.example` file contains
configuration that will mount your code into the container and add it to
`PERL5LIB`. Whenever you change your code in this situation, you will want to
restart the container

    docker-compose restart app

# Database

There's magic that sets up the database. It's in OpusVL::FB11, which you
installed as a dependency, or which you have because you're using docker.

    fb11-dbh -c 'dbi:Pg:host=db;dbname=fb11' -u fb11 -p fb11password \
        OpusVL::FB11::Schema deploy
    fb11-dbh -c 'dbi:Pg:host=db;dbname=fb11' -u fb11 -p fb11password \
        OpusVL::FB11::Schema upgrade

If you're using docker you can just put `docker-compose exec app` in front of
each command to run it within the container.

## Docker

The docker setup by default stores your postgres data in the directory `pgdata`.
You can override this in your override file simply by providing a new value for
the `volumes` array. We use a volume so that if you have to recreate this
container, you don't lose all the stuff you've done within the app.
