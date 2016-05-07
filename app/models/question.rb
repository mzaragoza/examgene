class Question < ActiveRecord::Base

  belongs_to :test
  has_many :answers

  validates :name, presence: true, uniqueness: { scope: :test_id, case_sensitive: false, message: "This test allredy has this question"}

  mount_uploader :photo,         ImageUploader
end
