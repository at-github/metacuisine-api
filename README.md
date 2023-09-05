# Metacuisine - API

## Setup

0. Be sure to use the correct ruby version
  - Install `rvm`
  - `rvm install ruby-3.0.5`
1. Be sure to have bundles installed
  `bundle install`
2. Fill database with samples
  `rails db:seed`
3. Start rails
  -> See "Launch"

## Launch

### WIP

TODO to clean
Launch app
/!\ Make sure DATABASE_URL is unset or empty
`PORT=xxxx rails s`
Nginx 
```
location / {
  proxy_pass http://localhost:xxxx
}
```

## Testing

`rails test`

## Other

`psql db_name db_user`
