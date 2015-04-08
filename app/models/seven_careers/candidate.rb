module SevenCareers
  class Candidate < ActiveRecord::Base
    belongs_to :seven_careers_job, :class_name => 'SevenCareers::Job'

    def image_size_validation
      if resume_path.size > 4.megabytes
        errors.add(:base, "Resume should be less than 4MB")
      end
    end
  #
  #   mount_uploaders :resume, ResumeUploader
  #   validates :resume_path,
  #             :presence => true,
  #             :file_size => {
  #                 :maximum => 4.megabytes.to_i
  #             }
  end
end
