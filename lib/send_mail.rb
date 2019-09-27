require 'mail'

class SendMail
  options = { :address => "smtp.gmail.com",
    :port => 465,
    :domain => 'Olivers-MacBook-Pro.local', #'add inside a string your hostname. Find your hostname by typing hostname in the terminal',
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

  def self.created_space(recipient)
    Mail.deliver do
      to recipient
      from 'gtomollie@gmail.com'
      subject 'You created a space on MakersBnB'
      body "This is a completely pointless email!"
    end
  end


  def self.mail_request(recipient)
    Mail.deliver do
      to recipient
      from 'gtomollie@gmail.com'
      subject 'Someone is interested in your property'
      body "Login to accept or deny their request"
      end
    end

def self.mail_confirm(recipient)
  Mail.deliver do
    to recipient
    from 'gtomollie@gmail.com'
    subject 'Get excited about your next getaway!'
    body "Consider yourself confirmed. STRICTLY NO REFUNDS"
    end
  end

  def self.mail_deny(recipient)
    Mail.deliver do
      to recipient
      from 'gtomollie@gmail.com'
      subject 'Try another property'
      body "Sorry to be a wet blanket but we don't like the cut of your jib"
      end
    end
end
