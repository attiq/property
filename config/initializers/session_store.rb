# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_property_session',
  :secret      => 'f151b384f70bdf4131f3b6bedf7ebb34cc3403ace4108d917aa49437176166a15e1f481c50e20b1b5b80501a3586e11f31e634e34f50b25546fb092e369d04e6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
