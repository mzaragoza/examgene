class Account < ActiveRecord::Base
  belongs_to :plan

  validates :domain,  presence: true, uniqueness: { case_sensitive: false }
  validates :name,    presence: true
  validates :plan_id, presence: true
end
