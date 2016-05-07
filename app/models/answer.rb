class Answer < ActiveRecord::Base

  belongs_to :question

  validates :name, presence: true, uniqueness: { scope: :question_id, case_sensitive: false, message: "This question allredy has this answer"}

  mount_uploader :photo,         ImageUploader
end

