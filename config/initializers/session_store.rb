# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_goals_session',
  :secret      => 'e594190aaaa85a5de6e4ef91c7f030ec8d0e7fe04275472a2eb455b5f4947c1a9df9e555ab6d0bd12027566e0f57bad5397d69cf3d3ab912328b3ea6eed99f7f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
