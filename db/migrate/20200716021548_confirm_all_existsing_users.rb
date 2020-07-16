class ConfirmAllExistsingUsers < ActiveRecord::Migration[5.1]
  def self.up
    User.update_all confirmed_at: DateTime.now
  end
end
