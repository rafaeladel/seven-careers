module SevenCareers
  class Candidate < ActiveRecord::Base
    belongs_to :seven_careers_job, :class_name => 'SevenCareers::Job'
  end
end
