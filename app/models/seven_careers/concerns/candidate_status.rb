module SevenCareers::Concerns::CandidateStatus
  extend ActiveSupport::Concern
  included do
    has_many :seven_careers_candidates, :class_name => 'SevenCareers::Candidate'
  end
end