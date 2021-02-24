#Load personal developer credentials
if Rails.env.development? || Rails.env.test?
  Rails.application.credentials.config.merge!(YAML.load_file('config/local_credentials.yml').deep_symbolize_keys)
end