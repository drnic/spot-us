config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching = true
config.action_mailer.raise_delivery_errors = false
config.action_view.debug_rjs = false
config.cache_classes = true
config.whiny_nils = true
SslRequirement.disable_ssl_check = false

if APP_CONFIG[:action_mailer].is_a?(Hash)
  config.action_mailer.delivery_method = APP_CONFIG[:action_mailer][:delivery_method]
  config.action_mailer.smtp_settings   = APP_CONFIG[:action_mailer][:smtp_settings]
end

config.after_initialize do
  Purchase.gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new({
    :login    => APP_CONFIG[:gateway][:login],
    :password => APP_CONFIG[:gateway][:password],
  })
end
PAYPAL_POST_URL = "https://www.paypal.com/cgi-bin/webscr"
PAYPAL_EMAIL = "info@spot.us"
S3_BUCKET = "spotus-production-storage"

