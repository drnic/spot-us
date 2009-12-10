# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spot-us_session',
  :secret      => '31522bc5320b6dd1117e1bfa94e8e7d87e1d7ebb9d823c9ac68891eedf7fac42d1e0dd90af1780700c2e4e5d1c0bb1ee81149a2db58abd92715cacc5ea92bc7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
