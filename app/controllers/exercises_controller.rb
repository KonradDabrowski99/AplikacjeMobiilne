class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  swagger_controller :exercises, 'Exercises'
  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.all
  end


# GET /exercises/1 or /exercises/1.json
  swagger_api :show do
     summary 'Returns one exercise'
     param :path, :id, :integer, :required, "Exercise id"
     notes 'Notes...'
   end
  # GET /exercises/1 or /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises or /exercises.json
  swagger_api :create do
    summary 'Create a Exercise'
    param :form, "exercise[description]", :string, :required, "Description"
    param :form, "exercise[type_of_exercise]", :string, :required, "Type of exercise"
    notes 'Notes...'
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end


  # POST /exercises or /exercises.json
  swagger_api :update do
    summary 'Update a exercise'
    param :path, :id, :integer, :required, "Exercise id"
    param :form, "exercise[description]", :string, :required, "Description"
    param :form, "exercise[type_of_exercise]", :string, :required, "Type of exercise"
    notes 'Notes...'
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  swagger_api :destroy do
    summary 'Delete a exercise'
    param :path, :id, :integer, :required, "Exercise id"
    notes 'Notes...'
  end
  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:description, :type_of_exercise)
    end
end
