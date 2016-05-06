class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  has_many :tests

  accepts_nested_attributes_for :account
  attr_accessor :updating_password
  mount_uploader :photo,         ImageUploader

  def name
    first_name + ' ' + last_name
  end

  def should_validate_password?
    updating_password || new_record?
  end
end
