# require 'mail'
#
#
#
#   feature 'sign up email' do
#     scenario 'user recieves sign up email' do
#       Mail.defaults do
#   delivery_method :test # in practice you'd do this in spec_helper.rb
# end
#
# describe "sending an email" do
#   include Mail::Matchers
#
#   before(:each) do
#     Mail::TestMailer.deliveries.clear
#
#     # Mail.deliver do
#     #   to ['mikel@me.com', 'mike2@me.com']
#     #   from 'you@you.com'
#     #   subject 'testing'
#     #   body 'hello'
#     # end
#   end
#       visit (/)
#       fill_in 'email', with: 'gtomollie@gmail.com'
#       fill_in 'username', with: 'GTO'
#       fill_in 'firstname', with: "Gigi"
#       fill_in 'lastname', with: "Tomollie"
#       fill_in 'password', with: "Yaaay"
#       click_on 'submit'
#     it { is_expected.to have_sent_email }
#     end
#   end
# end
