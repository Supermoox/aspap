class UserMailer < ApplicationMailer
  default from: 'onemoox@gmail.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'http://www.aspap.org/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to the ASPAP Network')
  end
end
