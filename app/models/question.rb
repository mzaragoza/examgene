class Question < ActiveRecord::Base

  belongs_to :test

  validates :name, presence: true, uniqueness: { scope: :test_id, case_sensitive: false, message: "This test allredy has this question"}
end
