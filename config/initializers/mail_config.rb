EXTERNAL_CONFIG_FILE_PATH = "#{::Rails.root.to_s}/config/config-routes.yml" if !defined?(EXTERNAL_CONFIG_FILE_PATH)
config_file_exists = FileTest.exists?(EXTERNAL_CONFIG_FILE_PATH)

case
when config_file_exists
# if it does exist, load it
config_file = YAML.load_file(EXTERNAL_CONFIG_FILE_PATH)[::Rails.env]
Andina::Application.config.mail_config = YAML.load_file(config_file['mail_config_path'])[::Rails.env] if FileTest.exists?(config_file['mail_config_path'])
if Andina::Application.config.mail_config == nil
  Andina::Application.config.mail_config = {
                  :address => "smtp.gmail.com",
                  :port => 537,
                  :domain => "gmail.com",
                  :username => "gian.corzo@gmail.com",
                  :password => "jeqse7in",
                  :authentication => "plain",
                  :enable_starttls_auto => true           
                }  
end
#
when !config_file_exists && ( ::Rails.env=='development' || ::Rails.env=='test' )
# otherwise use some sensible defaults, but only for dev or test
Andina::Application.config.mail_config = {
                  :address => "smtp.gmail.com",
                  :port => 537,
                  :domain => "gmail.com",
                  :username => "gian.corzo@gmail.com",
                  :password => "jeqse7in",
                  :authentication => "plain",
                  :enable_starttls_auto => true
              }
#
else
#if on prod, raise an error
raise "#{EXTERNAL_CONFIG_FILE_PATH} configuration file is missing"
end


ActionMailer::Base.smtp_settings = {
  :address              => Andina::Application.config.mail_config['address'],
  :port                 => Andina::Application.config.mail_config['port'],
  :domain               => Andina::Application.config.mail_config['domain'],
  :user_name            => Andina::Application.config.mail_config['username'],
  :password             => Andina::Application.config.mail_config['password'],
  :authentication       => Andina::Application.config.mail_config['authentication'],
  :enable_starttls_auto => Andina::Application.config.mail_config['enable_starttls_auto']
}
