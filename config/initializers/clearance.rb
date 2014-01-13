Clearance.configure do |config|
  config.mailer_sender = 'donotreply@signineasy.co'
  config.redirect_url = '/profile'
  config.cookie_expiration = lambda { |cookies| 4.weeks.from_now.utc }
end

