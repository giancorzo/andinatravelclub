class QuotesMailer < ActionMailer::Base
  default :from => "gian.corzo@gmail.com"

  def send_notification(quote)
      @quote = quote
      mail(:to => Andina::Application.config.mail_config['send_to'], :subject => "Cotizacion - #{@quote.name}")
  end

  def send_contact(contact)
    @contact = contact
    mail(:to => Andina::Application.config.mail_config['send_to'], :subject => "Andina - Contactenos")
  end
end
