module SevenCareers::Concerns::CandidateStatus
  extend ActiveSupport::Concern
  included do
    has_many :candidates, :class_name => 'SevenCareers::Candidate'
  end
end