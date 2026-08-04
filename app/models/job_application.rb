class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  enum :status, {
    applied: 0,
    shortlisted: 1,
    technical_interview: 2,
    cultural_fit_interview: 3,
    offered: 4,
    rejected: 5
  }

  validates :resume, presence: true
  validates :cover_letter, presence: true
end
