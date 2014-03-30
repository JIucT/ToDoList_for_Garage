# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TaskManager::Application.config.secret_key_base = '326ff542ae627ca589f94c85e88d13fd6d6909daf417c328f64875de302a489e726fb9cac8316d3551c8dd89dcbac814e565b9f9a303ccf1d31201cde3429921'
