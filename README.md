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
  `rails s`

## Launch

### WIP

To clean
Launch app
`PORT=xxxx rails s`
Nginx 
```
location / {
  proxy_pass http://localhost:xxxx
}
```

## Testing

`rails test`
