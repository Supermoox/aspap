class Research < ApplicationRecord
  belongs_to :directorate
  belongs_to :user
  after_create :approve

  private

    def approve
      if self.user.editor || self.user.publisher || self.user.vip || self.user.PR
        self.update(approve: true)
        self.save
      end 
    end
end
