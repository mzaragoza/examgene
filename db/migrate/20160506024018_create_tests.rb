class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :account_id
      t.integer :user_id
      t.string  :name,    null: false, default: ""

      t.timestamps null: false
    end
  end
end
