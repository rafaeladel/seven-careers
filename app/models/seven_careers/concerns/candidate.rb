module SevenCareers::Concerns::Candidate
  extend ActiveSupport::Concern
  included do
    belongs_to :seven_careers_job, :class_name => 'SevenCareers::Job'
    belongs_to :status, :class_name => 'SevenCareers::CandidateStatus'
  end

  def image_size_validation
    if resume_path.size > 4.megabytes
      errors.add(:base, "Resume should be less than 4MB")
    end
  end
end