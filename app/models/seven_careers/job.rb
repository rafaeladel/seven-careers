module SevenCareers
  class Job < ActiveRecord::Base
    has_many :seven_careers_candidates, :class_name => 'SevenCareers::Candidate'
  end
end
