module SevenCareers
  class CandidateStatus < ActiveRecord::Base
    has_many :seven_careers_candidates, :class_name => 'SevenCareers::Candidate'
  end
end
