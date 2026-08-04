class RemoveResumeFromJobApplications < ActiveRecord::Migration[8.1]
  def change
    remove_column :job_applications, :resume, :string
  end
end
