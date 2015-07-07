module SevenCareers::Concerns::CandidatesController
  extend ActiveSupport::Concern

  included do
    before_action :set_job
    before_action :set_candidate, only: [:show, :destroy]
  end

  # GET /jobs/1/candidates/1
  # GET /jobs/1/candidates/1.json
  def show
  end

  # GET /jobs/1/candidates/new
  def new
    @candidate = SevenCareers::Candidate.new
  end

  # POST /jobs/1/candidates
  # POST /jobs/1/candidates.json
  def create
    @candidate = SevenCareers::Candidate.new(candidate_params)
    @job.candidates << @candidate
     respond_to do |format|
      if @job.save
        format.html { redirect_to session[:back_url] || @job, notice: "You applied to the job successfully." }
        format.json { render :show, status: :created, location: @candidate }
        flash[:success] = "You applied to the job successfully."
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1/candidates/1
  # DELETE /jobs/1/candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_resume
    @candidate = SevenCareers::Candidate.find(params[:id])
    SevenCareers::ResumeMailer.send_resume(@candidate).deliver_now
    redirect_to :back, notice: 'Resume mailed successfully.'
    # format.html {redirect_to(:back, notice: 'Resume mailed successfully.')}
  end


  private

  def set_job
    @job = SevenCareers::Job.find(params[:job_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = SevenCareers::Candidate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone, :resume, :status_id)
  end
end