module SevenCareers::Concerns::Candidate
  extend ActiveSupport::Concern
  included do
    belongs_to :job, :class_name => 'SevenCareers::Job'
    belongs_to :candidate_status, :class_name => 'SevenCareers::CandidateStatus'
    mount_uploader :resume, SevenCareers::ResumeUploader
    validates :name, presence: true
  end

  def image_size_validation
    if resume_path.size > 4.megabytes
      errors.add(:base, "Resume should be less than 4MB")
    end
  end
end