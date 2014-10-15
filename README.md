# Birth date validator
Very minimal birth date validator to check if the user has the right age to sign in the website.

# Usage
Add to your Gemfile the following line.

```ruby
gem 'birth_date_validator'
```

Then add the following one to your model:

```ruby
validates :birth_date, birth_date: { almost: 18.years.ago, message: 'come back when you will be older' }
validates :birth_date, birth_date: { less_then: 18.years.ago }
validates :birth_date, birth_date: { range: 18.years.ago..30.years.old }
```

For further informations, have a look at the specs.
