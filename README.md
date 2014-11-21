== Dermalog

(1) Install Rails (e.g. http://railsinstaller.org/en)
(2) To install all necessary libraries (gems) run the following command on the console on the project's directory:
  bundle install
(3) To run the database migrations run:
  rake db:migrate
(4) To start the serve run:
  rails server
(5) The app will be available at localhost:3000/

== configure Mysql database

* Make sure you have mysql installed on your computer
* create a database called `dermalog` in your mysql db
* update `config/database.yml` with mysql settings

Here you just replace
```
development:
  <<: *default
  database: db/development.sqlite3
```
with
```
development:
  adapter: mysql
  encoding: utf8
  database: dermalog
  username: <mysql user>
  password: <mysql password>
  host: localhost
  port: 3306
  pool: 10

```

* add `gem 'mysql', '~> 2.9.1'` to the gemfile
* run `bundle install`
* run `rake db:migrate RAILS_ENV=development`

* change the secret keys in `config/secrets.yml`, to avoid session not found error

== push to stash
In the project's home directory

  git config --local user.name "<your full name>"

  git config --local user.email "<columbia email>"

  git remote set-url origin https://<username>@ase.cs.columbia.edu/stash/scm/team4_14/repo.git
  git push origin master
