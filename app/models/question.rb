class Question < ActiveRecord::Base

  belongs_to :test

  validates :name, presence: true
end
