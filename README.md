# **Gemset recommended**
Ruby 2.7.3 with Rails 5.2.6

# **Gems required for this project**
```
gem 'sqlite3', group: :development
gem 'pg', group: :production
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails' 
gem 'devise'
gem 'kaminari'
gem 'activeadmin'
```
# Heroku
**App in Heroku:** https://dltwiitter1.herokuapp.com/

**Admin login:** https://dltwiitter1.herokuapp.com/admin/login
```
Email: admin22@example.com
Password: 123456
```

# API
**Show last 50 tweets**
http://localhost:3000/api/v1/news

**Show tweets by date**
http://localhost:3000/api/v1/bydate/2021-09-06/2021-09-07
