# Simple api with Rails + MongoDB + Devise
### Requeriments
ruby 2.6.0p0 (Work with any 2.5* version)
Rails 5.2.2

### Usage
Install MongoDB
https://docs.mongodb.com/manual/installation/

First run bundle install
```
bundle install
```

Then create a user using rails console
```
rails c
User.create!(email: 'john_doe@example.com', :password => "111111", :password_confirmation => "111111" })
```
Save the generated token to authentication
Make some requests to the api
## Endpoints

# get /api/v1/quotes.json
Return all quotes from the user logged in
You must pass 2 headers:
X-User-Email 'john_doe@example.com'
X-User-Token  <token generated on user creation>

# post /api/v1/quotes
Create a quote from the logged user
The method create is already hard setted with params in the code, but you can change this to (quotes[:params])
```
    Quote.create!(
      author: current_user[:email],
      quote: 'Lorem ipsum dolor sit amet,',
      author_about: 'Lorem ipsum',
      tags: '',
      user_id: current_user[:id]
    )
```
