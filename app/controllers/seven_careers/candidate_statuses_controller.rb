require_dependency "seven_careers/application_controller"

module SevenCareers
  class CandidateStatusesController < ApplicationController
    include SevenCareers::Concerns::CandidateStatusesController
  end
end
