require_dependency "seven_careers/application_controller"

module SevenCareers
  class JobsController < ApplicationController
    include SevenCareers::Concerns::JobsController
  end
end
