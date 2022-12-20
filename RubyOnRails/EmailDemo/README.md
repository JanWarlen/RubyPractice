# README
1. 在Gemfile中添加依赖
```shell
# Gemfile
gem 'actionmailer'
```
项目根目录执行 `bundle install`  
2. 生成mailer
```shell
rails generate mailer UserMailer
```
3. 编写demo发送邮件代码
```ruby
# app/mailers/user_mailer.rb
default from: 'emailAddress'
class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to our site!')
  end
end
```
4. 创建邮件发送模版
```html
<!-- app/views/user_mailer/welcome.html.erb -->
<h1>Welcome to our site, <%= @user.name %>!</h1>
<p>Thanks for signing up. We're glad you're here.</p>
```
5. 添加邮件发送配置
```shell
# config/environments/development.rb

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'smtp.example.com',
  port: 587,
  user_name: 'your_username',
  password: 'your_password',
  authentication: 'plain',
  enable_starttls_auto: true
}
```
6. 生成一个简单的 User 脚手架
```shell
$ rails generate scaffold user name email login
$ rake db:migrate
```
7. 编写简单controller调用邮件发送代码
```ruby
# frozen_string_literal: true
# app/controllers/mail_controller.rb
class MailController < ApplicationController

  def index
    user = User.find(1)
    UserMailer.welcome(user).deliver_now
    @user = user
  end
end
```
8. 添加对应页面方便触发controller
```html
<!--app/views/mail/index.html.erb-->
<h1>Welcome to our site, <%= @user.name %>!</h1>
<p>Thanks for signing up. We're glad you're here.</p>
```
9. 数据库人工填充数据

10. 浏览器访问`http://127.0.0.1:3000/mail`