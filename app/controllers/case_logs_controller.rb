class CaseLogsController < ApplicationController
  before_action :set_case_log, only: [:show, :edit, :update, :destroy]

  # GET /case_logs
  # GET /case_logs.json
  def index
    if current_user.try(:admin)
      @case_logs = CaseLog.all
    else
      @case_logs = current_user.case_logs
    end
    @shares = current_user.shares
  end

  # GET /case_logs/1
  # GET /case_logs/1.json
  def show
    @doctor = @case_log.doctor
    @images = @case_log.images
  end

  # GET /case_logs/new
  def new
    @case_log = CaseLog.new
  end

  # GET /case_logs/1/edit
  def edit
  end

  # POST /case_logs
  # POST /case_logs.json
  def create
    @case_log = CaseLog.new(case_log_params)

    @case_log.doctor = current_user

    respond_to do |format|
      if @case_log.save
        format.html { redirect_to @case_log, notice: 'Case log was successfully created.' }
        format.json { render :show, status: :created, location: @case_log }
      else
        format.html { render :new }
        format.json { render json: @case_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_logs/1
  # PATCH/PUT /case_logs/1.json
  def update
    respond_to do |format|
      if @case_log.update(case_log_params)
        format.html { redirect_to @case_log, notice: 'Case log was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_log }
      else
        format.html { render :edit }
        format.json { render json: @case_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_logs/1
  # DELETE /case_logs/1.json
  def destroy
    @case_log.destroy
    respond_to do |format|
      format.html { redirect_to case_logs_url, notice: 'Case log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_log
      @case_log = CaseLog.find_by_id(params[:id])
       if not @case_log
        redirect_to case_logs_url, notice: 'There is no case log with id ' + params[:id]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_log_params
      params.require(:case_log).permit(:patient_name, :patient_date_of_birth, :patient_gender, :description, :diagnosis, :treatment, :title, :doctor_id, :share)
    end
end
