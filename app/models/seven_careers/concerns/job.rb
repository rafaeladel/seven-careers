module SevenCareers::Concerns::Job
  extend ActiveSupport::Concern
  included do
    has_many :candidates, :class_name => 'SevenCareers::Candidate'
  end
end