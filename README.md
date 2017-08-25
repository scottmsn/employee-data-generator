# Employee Data Generator

## Setup

- Clone the project
- `bundle install`

## Run tests

- `bundle exec rake`

## Execute

- `bundle exec rake generate:csv`

### Configurations

- Set `USERS` env to define number of users to generate
- Eg. `USERS=500 bundle exec rake generate:csv`
- Set `TEMPLATE` env to define demographics template
- Eg. [sample demographic template](template/source_template.csv)
