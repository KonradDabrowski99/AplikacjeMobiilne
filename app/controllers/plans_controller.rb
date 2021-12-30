class PlansController < ApplicationController

  before_action :require_token, only: [:create]
  skip_before_action :verify_authenticity_token
  before_action :set_plan, only: %i[ show edit update destroy add_exercise ]
  swagger_controller :plans, 'Plans'

  # GET /plans or /plans.json
  swagger_api :index do
      summary 'Returns all plans'
      notes 'Notes...'
    end

  def index
    @plans = Plan.all
  end

  def add_exercises
    redirect_to create_exercise_url
  end

    # GET /plans/1 or /plans/1.json
  swagger_api :show do
     summary 'Returns one  plan'
     param :path, :id, :integer, :required, "Plan id"
     notes 'Notes...'
   end

  # GET /plans/1 or /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end


# POST /plans or /plans.json
  swagger_api :create do
    summary 'Create a plan'
    param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "plan[public]", :boolean, :required, "Is public"
    param :form, "plan[plan_name]", :string, :required, "Plan name"
    param :form, "plan[user_id]", :string, :required, "User id"
    notes 'Notes...'
  end

  # POST /plans or /plans.json
  def create
    @plan = Plan.new(plan_params)
    @plan.user=current_user

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: "Plan was successfully created." }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
 swagger_api :update do
    summary 'Update a plan'
    param :path, :id, :integer, :required, "Plan id"
    param :form, "plan[public]", :boolean, :required, "Is public"
    param :form, "plan[plan_name]", :string, :required, "Plan name"
    notes 'Notes...'
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: "Plan was successfully updated." }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /plans/1 or /plans/1.json
    swagger_api :destroy do
      summary 'Delete a plan'
      param :path, :id, :integer, :required, "Plan id"
      notes 'Notes...'
    end
  # DELETE /plans/1 or /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: "Plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:plan_name, :public)
    end
end
