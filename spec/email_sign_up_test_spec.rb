require 'mail'
require './lib/send_mail.rb'

Mail.defaults do
  delivery_method :test # in practice you'd do this in spec_helper.rb
end

describe "sending a sign_up email" do
  include Mail::Matchers
  before(:each) do
    Mail::TestMailer.deliveries.clear
    SendMail.sign_up_mail('gtomollie@gmail.com')
  end
it { is_expected.to have_sent_email.with_subject('test') }
end
