# Metacuisine - API

## Setup

1. Be sure to use the correct ruby version
  - [ ] Install `rvm`
  - [ ] `rvm install ruby-3.0.5`
2. Be sure to have bundles installed
  `bundle install`
3. Fill database with samples
  `rails db:seed`

### Nginx 
```nginx
location / {
  proxy_pass http://localhost:xxxx
}
```

## Launch

### Env

**/!\ Make sure DATABASE_URL is unset**

`PORT=xxxx rails s` For dev

`PORT=xxxx RAILS_ENV=production rails s` For production

## Testing

`rails test`
