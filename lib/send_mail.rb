require 'mail'

options = { :address => "smtp.gmail.com",
  :port => 465,
  :domain => #'add inside a string your hostname. Find your hostname by typing hostname in the terminal',
  :user_name => 'gtomollie',
  :password => 'makersbnb!',
  :authentication => :login,
  :ssl => true,
  :openssl_verify_mode => 'none'
  }

  Mail.defaults do
    delivery_method :smtp, options
  end


def mail_that(recipient ='gtomollie@gmail.com', subjects="test", body_message="test")
  Mail.deliver do
    to recipient
    from 'gtomollie@gmail.com'
    subject subjects
    body body_message
  end
end

mail_that('gtomollie@gmail.com', 'new test', 'test')
