# config/initializers/secret_token.rb

# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Andinatravelclub::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  '8c5f5ccc27aa7661beb0db272974279b0d3eda84122b79a3ad7381d55883bc9748ad325fd3160a8c895c2c543d20d06c927d7b2af405b233986b34f60061daf3'
else
  ENV.fetch("SECRET_KEY_BASE")
end