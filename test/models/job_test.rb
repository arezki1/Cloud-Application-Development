require 'test_helper'

class JobTest < ActiveSupport::TestCase

  def test_should_not_save_job_without_title
    job = Job.new
    assert !job.save
  end

end
