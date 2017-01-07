class AddAttachmentContactImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :contact_image
    end
  end

  def self.down
    remove_attachment :pages, :contact_image
  end
end
