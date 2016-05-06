class Account < ActiveRecord::Base
  belongs_to :plan
  has_many :tests
  has_many :users

  validates :domain,  presence: true, uniqueness: { case_sensitive: false }
  validates :name,    presence: true
  validates :plan_id, presence: true
end
