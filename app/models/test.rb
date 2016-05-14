class Test < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  has_many :questions

  validates :name, presence: true
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  def shuffle_questions(options ={})
    if options[:randomize]
      questions.shuffle
    else
      questions
    end
  end
end
