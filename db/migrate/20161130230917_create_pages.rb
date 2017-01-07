class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :user_id
      t.string :owner_id

      t.timestamps
    end
  end
end
