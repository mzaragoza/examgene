class Test < ActiveRecord::Base
  belongs_to :account
  belongs_to :user
  has_many :questions, :dependent => :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true


  def shuffle_questions(options ={})
    if options[:randomize]
      questions.shuffle
    else
      questions
    end
  end
end
