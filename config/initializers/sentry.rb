Sentry.init do |config|
  config.dsn = 'https://2b4d1adaf9a79d33aca4892fd3ed72d4@o4507601057808384.ingest.de.sentry.io/4509790950064208'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Add data like request headers and IP for users,
  # see https://docs.sentry.io/platforms/ruby/data-management/data-collected/ for more info
  config.send_default_pii = true
end