module SevenCareers::Concerns::CandidatesController
  extend ActionSupport::Concern

  included do
    before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  end

  def index
    @candidates = SevenCareers::Candidate.all
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = SevenCareers::Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = SevenCareers::Candidate.new
    @candidate.name = candidate_params[:name]
    @candidate.email = candidate_params[:email]
    @candidate.phone = candidate_params[:phone]
    @candidate.job_id = session[:apply_job_id]

    resume = candidate_params[:resume]

    uploader = ResumeUploader.new
    uploader.store!(resume)

    # resume_path = candidate_params[:resume]
    # resume_filename = "#{Random.rand(99999)} " + "#{resume_path.original_filename}"
    #
    # File.open(Rails.root.join('public', 'resumes', resume_filename), 'wb') do |file|
    #
    #   file.write(resume_path.read)
    # end

    # @candidate.resume_path = resume_filename
    @candidate.resume_path = uploader.filename

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: "You applied to the job successfully." }
        format.json { render :show, status: :created, location: @candidate }
        session.delete(:apply_job_id)
        flash[:success] = "You applied to the job successfully."
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        # format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.html {redirect_to(:back)}
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
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
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = SevenCareers::Candidate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone, :resume, :status_id)
  end
end