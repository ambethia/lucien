# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lucien_session',
  :secret      => 'da7d976f9b3d352914801ba39996629909a1303d8d7783bdd9bf551b31d3f768aaea2bfb22d8e0a091ba2e72004acd8a0b0b27d6db110f8a2630e7c42566330a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
