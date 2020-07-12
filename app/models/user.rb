class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :subscribe_user_to_mailing_list
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :researches, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articomments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :manuscripts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :editors, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :downloads, dependent: :destroy
  has_one :membership, dependent: :destroy



  enum qualification: [:PhD, :Dsc, :Msc, :MEng, :Bsc, :BEng, :Dip, :Cert]
  enum title: [:Mr, :Ms, :Dr, :Prof, :Mrs]

  has_attached_file :image,
   styles: { small: "64x64", medium: "100x100", large: "300x300" }
   validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
   validates_uniqueness_of :username  


  has_attached_file :document
    validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  private

  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end

end
