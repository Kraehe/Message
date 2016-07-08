class ChangePhoneToString < ActiveRecord::Migration[5.0]
  def change
    change_column :messengers, :phone, :string
  end
end
