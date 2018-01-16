# Employee Data Generator

## Setup

- Clone the project
- `bundle install`

## Run tests

- `bundle exec rake`

## Execute

- `bundle exec rake generator:csv`

### Configurations

- Create a `tmp` folder to store the file eg. `mkdir tmp`
- Set `USERS` env to define number of users to generate
- Set `EMAIL_DOMAIN` env to define the email domain, defaults to 'example.com'
- Eg. `USERS=500 EMAIL_DOMAIN=fakedomain.com bundle exec rake generator:csv`
- Set `TEMPLATE` env to define demographics template
- Eg. [sample demographic template](template/source_template.csv)
