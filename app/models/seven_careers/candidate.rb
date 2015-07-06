module SevenCareers
  class Candidate < ActiveRecord::Base
    include SevenCareers::Concerns::Candidate
  end
end
