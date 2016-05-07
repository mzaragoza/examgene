class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string  :name,    null: false, default: ""
      t.string  :photo,   null: false, default: ""
      t.boolean :is_correct, default: false

      t.timestamps null: false
    end
  end
end
