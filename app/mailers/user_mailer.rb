class UserMailer < ActionMailer::Base

  default from: "from@example.com"

  def forget_password_email(email)
    @user = User.find_by_email(email)
    new_token = User.generate_session_token
    @user.session_token = new_token
    @user.save!

    @url = Addressable::URI.new(
       :scheme => "http",
       :host => "localhost:3000",
       :path => reset_password_page_session_path,
       :query_values => { :session_token => @user.session_token }
     ).to_s

     mail(to: @user.email, subject: 'Reset your password')
   end
end