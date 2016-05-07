class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.string  :name,    null: false, default: ""

      t.timestamps null: false
    end
  end
end
