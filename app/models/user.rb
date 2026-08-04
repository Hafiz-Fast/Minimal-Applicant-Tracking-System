class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  
  enum :role, {
    applicant: 0,
    recruiter: 1
  }

  has_many :jobs, dependent: :destroy
  has_many :job_applications, dependent: :destroy
end
