class UserMailer < ActionMailer::Base
	'layout user_mailer'

	 default from: "Aspap <info@aspap.org>"

    def user_welcome user
		 @user = user

		 mail to: user.email, subject: "Welcome to ASPAP!"

    end

end