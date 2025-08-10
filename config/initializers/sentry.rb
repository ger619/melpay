Sentry.init do |config|
  config.dsn = 'https://130aeded055c1ce973d044dcee1abff5@o4507601057808384.ingest.de.sentry.io/4509790951178320'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Add data like request headers and IP for users,
  # see https://docs.sentry.io/platforms/ruby/data-management/data-collected/ for more info
  config.send_default_pii = true
end

