require_dependency "seven_careers/application_controller"

module SevenCareers
  class CandidatesController < ApplicationController
    include SevenCareers::Concerns::CandidatesController
  end
end
