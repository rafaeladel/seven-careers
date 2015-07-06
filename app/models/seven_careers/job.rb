module SevenCareers
  class Job < ActiveRecord::Base
    include SevenCareers::Concerns::Job
  end
end
