# README


### Ruby version
    Ruby 2.5.7

### Rails version
    Rails 5.2.3

## Configuration of the app
* install Postgres.app(https://www.postgresql.org/download/macosx/)
* `brew install postgres` (or do elephant version from postgresapp.com)
* git clone https://github.com/var9un/shorten_url.git
* get ruby with https://rvm.io/rvm/install
* `\curl -sSL https://get.rvm.io | bash`
* `rvm install ruby-2.5.7`
* `gem install bundler`
* Go to the project directory
* `bundle install`
* start postgres (postgres -D /usr/local/var/postgresql &)
* `rake db:create`
* `rake db:migrate`

### Configuration
Set following environment variable

- USER_NAME: '********'
- PASSWORD: '********'
- TEST_DB_NAME: '********'
- DB_NAME: '********'

### How to run the test suite
Run the following command in your terminal:
`rspec`
