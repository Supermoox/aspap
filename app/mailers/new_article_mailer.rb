class NewArticleMailer < ApplicationMailer
  def new_article_email
    @article = params[:article]
    mail(to: EMAIL_ADMIN, subject: "You got a new Article!")
  end
end
