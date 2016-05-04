class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string   "name",                                                default: ""
      t.string   "slug",                                                default: ""
      t.decimal  "price",                       precision: 8, scale: 2
      t.boolean  "active",                                              default: true
      t.boolean  "featured",                                            default: false
      t.timestamps
    end
  end
end
