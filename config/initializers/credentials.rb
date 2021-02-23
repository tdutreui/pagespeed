#Load personal developer credentials
Rails.application.credentials.config.merge!(YAML.load_file('config/local_credentials.yml').deep_symbolize_keys)