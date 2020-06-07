# Preview all emails at http://localhost:3000/rails/mailers/new_article_mailer
class NewArticleMailerPreview < ActionMailer::Preview
  def new_article_email
    # Set up a temporary order for the preview
    article = Article.new(title: "Black Hoe", body: "tetsing the mailing system!")

    OrderMailer.with(article: article).new_article_email
  end

end
