# MSFLOSS Email API

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

##Endpoints
This project is currently providing a herokuapp for checking the results.

### Local
```
localhost:4567/api/v1/emails
localhost:4567/api/v1/emails/count
localhost:4567/api/v1/emails/:id
localhost:4567/api/v1/emails/query?field1=value1&field1=value2...
```

### Heroku
```
https://limitless-taiga-45801.herokuapp.com/api/v1/emails
https://limitless-taiga-45801.herokuapp.com/api/v1/emails/count
https://limitless-taiga-45801.herokuapp.com/api/v1/emails/id/:id
https://limitless-taiga-45801.herokuapp.com/api/v1/emails/query?field1=value1&field1=value2...
```

### Query Params

| fields                    | values eg:                                       | note                                                   | description                                                              |
|---------------------------|--------------------------------------------------|--------------------------------------------------------|--------------------------------------------------------------------------|
| sender                    | sender@sender.org                                | will search for the exactly string                     | email "from" field                                                       |
| recipient                 | recipient@recipient.org                          | will search for the exactly string                     | email "to" field                                                         |
| message_contains          | this message is an example                       | will search for messages containing the string         | message body                                                             |
| subject                   | Re: [PATCH] subsystem: this is a subject example | will search for the exactly string                     | email title                                                              |
| subject_contains          | PATCH                                            | will search for subject containing the string          | email title                                                              |
| start_date                | 20190501                                         | will limit emails with date >= value                   | email date                                                               |
| end_date                  | 20190502                                         | will limit emails with date <= value                   | email date                                                               |
| message_id                | cRazYiD                                          | will search for the exactly string                     | gmail message unique id                                                  |
| in_reply_to               | cRazYiD                                          | will search for the exactly string                     | if the message is a reply, it's the message_id from the original message |
| action                    | PATCH                                            | will search for the exactly string                     | what is in the subject message under []                                  |
| subsystem                 | iio                                              | will search for the exactly string                     | what is in the subject message after ] and before :                      |
| subject_original          | [PATCH] subsystem: this is a subject example     | will search for the exactly string                     | Subject without "RE:"                                                    |
| subject_original_contains | [PATCH] subsystem: this is a subject example     | will search for subject_original containing the string | Subject without "RE:"                                                    |