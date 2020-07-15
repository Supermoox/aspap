class UserMailer < ActionMailer::Base
	'layout user_mailer'

	 default from: "Aspap <support@aspap.org>"

    def user_welcome user
		 @user = user

		 mail to: user.email, subject: "Thanks for your purchase!"

    end

end