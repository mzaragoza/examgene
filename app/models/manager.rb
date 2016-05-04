class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :updating_password
  mount_uploader :photo,         ImageUploader

  def name
    first_name + ' ' + last_name
  end

  def should_validate_password?
    updating_password || new_record?
  end
end
