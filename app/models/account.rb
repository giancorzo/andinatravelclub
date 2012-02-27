require 'digest/sha1'

class Account < ActiveRecord::Base
    
  validates :email, :presence => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  def password
    @password
  end

  def password=(password)
    @password = password
    return if password.blank?
    do_salt
    self.crypt_password = Account.encrypt password, self.salt
    logger.info "crypt password = " + self.crypt_password
  end

  def self.authenticate(email, password)
    account = self.find_by_email email
    if account
      encrypt_password = self.encrypt password, account.salt
      if account.crypt_password != encrypt_password
        account = nil
      end
    end
    account
  end
  
  private

  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest(password + salt + Andina::Application.config.secret_token)
  end

  def do_salt
    self.salt = self.object_id.to_s + rand.to_s
    logger.info "salt" + self.salt.to_s
  end  
  
end
