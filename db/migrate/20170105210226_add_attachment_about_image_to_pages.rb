class AddAttachmentAboutImageToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :about_image
    end
  end

  def self.down
    remove_attachment :pages, :about_image
  end
end
