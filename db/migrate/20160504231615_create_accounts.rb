class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string   :domain,             default: ""
      t.integer  :plan_id
      t.string   :name,               default: ""
      t.string   :logo,               default: ""
      t.string   :website,            default: ""
      t.string   :stripe_customer_id, default: ""
      t.text     :stripe_customer,    default: ""
      t.boolean  :active,             default: true
      t.timestamps
    end
  end
end
