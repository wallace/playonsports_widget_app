# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_playonsports_widget_app_session',
  :secret      => '09fedec9b918bf1848989abc46c10f83d4f353cce2a8f8f882ffd89961fde3928df369c1f8ea3697f1a9e97993c69570a451750bff2fd159bb80150c97b7060d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
