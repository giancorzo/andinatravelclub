Andinatravelclub::Application.config.mail_config = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :username => "upc.dew@gmail.com",
  :password => "GFsa22Dsq!",
  :authentication => "plain",
  :enable_starttls_auto => true,
  :send_to => "gian.corzo@gmail.com"
}

ActionMailer::Base.smtp_settings = {
  :address              => Andinatravelclub::Application.config.mail_config['address'],
  :port                 => Andinatravelclub::Application.config.mail_config['port'],
  :domain               => Andinatravelclub::Application.config.mail_config['domain'],
  :user_name            => Andinatravelclub::Application.config.mail_config['username'],
  :password             => Andinatravelclub::Application.config.mail_config['password'],
  :authentication       => Andinatravelclub::Application.config.mail_config['authentication'],
  :enable_starttls_auto => Andinatravelclub::Application.config.mail_config['enable_starttls_auto']
}
