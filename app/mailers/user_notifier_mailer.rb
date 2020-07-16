class UserNotifierMailer < ApplicationMailer

  'layout user_notifier_mailer'

   default from: "Aspap <info@aspap.org>"
  # send a signup email to the user, pass in the user object that   contains the user's email address

  def notify_user
    @users = Users.all
    @article = Article.last(3)
    emails = @users.collect(&:email).join(", ")
    mail(to: emails, subject: "Hi, this is a test mail.")
  end

end