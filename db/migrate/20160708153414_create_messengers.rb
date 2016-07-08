class CreateMessengers < ActiveRecord::Migration[5.0]
  def change
    create_table :messengers do |t|
      t.string :email
      t.int :phone
      t.text :message

      t.timestamps
    end
  end
end
