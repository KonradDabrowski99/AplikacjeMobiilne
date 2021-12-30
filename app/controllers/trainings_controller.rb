class TrainingsController < ApplicationController
  before_action :set_training, only: %i[ show edit update destroy ]
  swagger_controller :trainings, 'Trainings'


  # GET /trainings or /trainings.json
  swagger_api :index do
    summary 'Returns all trainings'
    notes 'Notes...'
  end

  def index
    @trainings = Training.all
  end

  # GET /trainings/1 or /trainings/1.json
  def show
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /plans or /plans.json
    swagger_api :create do
      summary 'Create a training'
      param :header, "Authorization", :string, :required, "Authentication token"
      param :form, "training[date]", :date, :required, "Trainig date"
      param :form, "training[status]", :float, :required, "training status"
      param :form, "training[plan_id]", :integer, :required, "Field id"
      notes 'Notes...'
    end

  # POST /trainings or /trainings.json
  def create
    @training = Training.new(training_params)
    @training.user=current_user

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: "Training was successfully created." }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1 or /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: "Training was successfully updated." }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1 or /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: "Training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_params
      params.require(:training).permit(:date, :status, :user_id, :plan_id)
    end
end
