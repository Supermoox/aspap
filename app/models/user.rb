class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :researches
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :manuscripts
  has_many :reviews, dependent: :destroy
  has_many :editors, dependent: :destroy


  enum qualification: [:PhD, :Dsc, :Msc, :MEng, :Bsc, :BEng, :Dip, :Cert]
  enum title: [:Mr, :Ms, :Dr, :Prof, :Mrs]
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  has_attached_file :image, styles: { thumb: "100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_uniqueness_of :username
  
  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
