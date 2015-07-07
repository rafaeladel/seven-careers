module SevenCareers::Concerns::CandidateStatusesController
  extend ActiveSupport::Concern

  included do
    before_action :set_candidate_status, only: [:show, :edit, :update, :destroy]
  end

  # GET /candidate_statuses
  def index
    @candidate_statuses = SevenCareers::CandidateStatus.all
  end

  # GET /candidate_statuses/1
  def show
  end

  # GET /candidate_statuses/new
  def new
    @candidate_status = SevenCareers::CandidateStatus.new
  end

  # GET /candidate_statuses/1/edit
  def edit
  end

  # POST /candidate_statuses
  def create
    @candidate_status = SevenCareers::CandidateStatus.new(candidate_status_params)

    if @candidate_status.save
      redirect_to @candidate_status, notice: 'Candidate status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /candidate_statuses/1
  def update
    if @candidate_status.update(candidate_status_params)
      redirect_to @candidate_status, notice: 'Candidate status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /candidate_statuses/1
  def destroy
    @candidate_status.destroy
    redirect_to candidate_statuses_url, notice: 'Candidate status was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate_status
    @candidate_status = SevenCareers::CandidateStatus.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def candidate_status_params
    params.require(:candidate_status).permit(:name)
  end
end