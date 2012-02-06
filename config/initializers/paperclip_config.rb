EXTERNAL_CONFIG_FILE_PATH = "#{::Rails.root.to_s}/config/config-routes.yml" if !defined?(EXTERNAL_CONFIG_FILE_PATH)
config_file_exists = FileTest.exists?(EXTERNAL_CONFIG_FILE_PATH)

case
when config_file_exists
# if it does exist, load it
config_file = YAML.load_file(EXTERNAL_CONFIG_FILE_PATH)[::Rails.env]
Andina::Application.config.paperclip_config = YAML.load_file(config_file['images_config_path'])[::Rails.env] if FileTest.exists?(config_file['images_config_path'])
if Andina::Application.config.paperclip_config == nil
  Andina::Application.config.paperclip_config = {
                  :server_path => "/data/www.andinatravelclub.com/images",
                  :large => "100x100>",
                  :medium => "50x50>",
                  :small => "30x30>"
                }
end
#
when !config_file_exists && ( ::Rails.env=='development' || ::Rails.env=='test' )
# otherwise use some sensible defaults, but only for dev or test
  Andina::Application.config.paperclip_config = {
                  :server_path => "/data/www.andinatravelclub.com/images",
                  :large => "100x100>",
                  :medium => "50x50>",
                  :small => "30x30>"
                }
#
else
#if on prod, raise an error
raise "#{EXTERNAL_CONFIG_FILE_PATH} configuration file is missing"
end
