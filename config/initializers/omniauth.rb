OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1785825761745048", "9254fdf3cc4a4c26a41e2eb7e77ab691"
end
