class AddAttachmentContactImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :contact_image
    end
  end

  def self.down
    remove_attachment :users, :contact_image
  end
end
