# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trendlinks_session',
  :secret      => '44088e347400d1d769bc997e351cc5ed345acd44810fb5ffd04f3292745bccdcad7c28baae15dfcc807e13587da6cb5bbfb86a9fd63b6af6abc5ab9b500eb952'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
