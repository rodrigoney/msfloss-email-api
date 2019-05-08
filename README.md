# MSFLOSS Email Api

## Goal
The goal is to create a service that can provide an API to gather information about the email robot database by querying it.

### Set Environment Variables

Some `env vars` are needed to run the project locally and reach the real database

```
export MSFLOSS_DATABASE_HOST=<hostname>
export MSFLOSS_DATABASE_NAME=<database-name>
export MSFLOSS_DATABASE_USER=<username>
export MSFLOSS_DATABASE_PASSWORD=<password>
```

### Prepare for execution

```
bundle install
rake db:migrate

```

### Running Locally
```
bundle exec rackup -p 9292 config.ru
```


### Testing
This project uses `rspec` for testing.
To run the tests execute the follow command in the root path of the project.
```
rspec
```

## Endpoints
This project is currently providing a herokuapp for checking the results.

### Local
```
localhost:4567/api/v1/emails
localhost:4567/api/v1/emails/count
localhost:4567/api/v1/emails/:id
```

### Heroku
```
https://limitless-taiga-45801.herokuapp.com/api/v1/emails
https://limitless-taiga-45801.herokuapp.com/api/v1/emails/count
https://limitless-taiga-45801.herokuapp.com/api/v1/emails/:id
```
