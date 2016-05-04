class AddPhotoToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :photo, :string, default: ''
  end
end
