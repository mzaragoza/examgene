class Plan < ActiveRecord::Base
  validates :name,  presence: true
  validates :slug,  presence: true
  validates :price, presence: true

  validates :name, uniqueness: { case_sensitive: false }
  validates :slug, uniqueness: { case_sensitive: false }
end
