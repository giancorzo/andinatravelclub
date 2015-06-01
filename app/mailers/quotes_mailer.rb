#encoding:UTF-8
class QuotesMailer < ActionMailer::Base
  default :from => "upc.dew@gmail.com"

  def send_notification(quote)
      @quote = quote
      logger.info "Sending to #{Andinatravelclub::Application.config.mail_config[:send_to]}"
      mail(:to => Andinatravelclub::Application.config.mail_config[:send_to], :subject => "Cotización - #{@quote.name}")
  end

  def send_contact(contact)
    @contact = contact
    logger.info "Sending to #{Andinatravelclub::Application.config.mail_config[:send_to]}"
    mail(:to => Andinatravelclub::Application.config.mail_config[:send_to], :subject => "Andina - Contáctenos")
  end
end
