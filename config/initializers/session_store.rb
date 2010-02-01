# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rentlook_session',
  :secret      => 'fc68239400aa52b2b8bb2148166e4281f785e21a8d01acd88e5c2b1c571dad13c97e31340c7673c0ca4f2798bd94b5ac33292bd4cb0b73d2077e2cd3ff8e225d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
