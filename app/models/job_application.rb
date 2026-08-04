class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_one_attached :resume

  enum :status, {
    applied: 0,
    shortlisted: 1,
    technical_interview: 2,
    cultural_fit_interview: 3,
    offered: 4,
    rejected: 5
  }

  validates :cover_letter, presence: true
  validate :resume_must_be_attached
  validate :acceptable_resume

  private

  def resume_must_be_attached
    errors.add(:resume, "must be attached") unless resume.attached?
  end

  def acceptable_resume
    return unless resume.attached?

    unless resume.content_type == "application/pdf"
      errors.add(:resume, "must be a PDF")
    end
  end
end
