class CreateJobsRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_recruiters, :id=>false do |t|
      t.integer "recruiter_id"
      t.integer "job_id"
    end
  end
end
