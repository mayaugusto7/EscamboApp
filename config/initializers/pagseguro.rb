PagSeguro.configure do |config|
  config.token       = Rails.application.secrets.PAGSEGURO_EMAIL
  config.email       = Rails.application.secrets.PAGSEGURO_TOKEN

  if Rails.env.production?
    config.environment = :production # ou :sandbox. O padrão é production.
  else
    config.environment = :sandbox # ou :sandbox. O padrão é production.
  end

  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end