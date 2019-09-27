require 'mail'

class SendMail
  options = { :address => "smtp.gmail.com",
    :port => 465,
    :domain => 'Julians-MacBook-Pro.local', #'add inside a string your hostname. Find your hostname by typing hostname in the terminal',
    :user_name => 'gtomollie',
    :password => 'makersbnb!',
    :authentication => :login,
    :ssl => true,
    :openssl_verify_mode => 'none'
  }

  Mail.defaults do
    delivery_method :smtp, options
  end

  def self.mail_that(recipient ='gtomollie@gmail.com', subjects="test", body_message="test")
    Mail.deliver do
      to recipient
      from 'gtomollie@gmail.com'
      subject subjects
      body body_message
    end
  end

  def self.sign_up_mail(recipient ='gtomollie@gmail.com', subjects="test")
    Mail.deliver do
      to recipient
      from 'gtomollie@gmail.com'
      subject subjects
      body "CONGRATULATIONS! You have signed up. No refunds."
    end
  end

end
