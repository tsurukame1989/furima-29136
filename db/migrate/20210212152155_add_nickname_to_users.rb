class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  # Userモデルにカラムを追加
  def change
    add_column :users, :nickname,           :string, null: false
    add_column :users, :first_name,         :string, null: false
    add_column :users, :last_name,          :string, null: false
    add_column :users, :first_name_reading, :string, null: false
    add_column :users, :last_name_reading,  :string, null: false
    add_column :users, :birthday,           :date,   null: false
  end
end
