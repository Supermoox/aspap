class AddPictureToPictures < ActiveRecord::Migration[5.1]
  def change
	  def self.up
	    add_attachment :pictures, :picture
	  end

	  def self.down
	    remove_attachment :pictures, :picture
	  end
  end
end
