class ResultsController < ApplicationController
  before_action :set_measurement
  before_action :set_assessment
  before_action :set_user
  before_action :set_group

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      results = result_params
      unless results.nil?
        stay = true
        results.each do |id, val|
          r = @measurement.results.find_by_student_id(id)
          unless r.nil?
            if val.is_a?(Hash)
              r.parse_Hash(val)
              @last = r
            else
              r.parse_csv(val)
              stay = false
            end
          end
        end
        format.js {
          unless stay
            render 'assessments/show'
          else
            render :edit
          end
        }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    def set_measurement
      @measurement = Measurement.find(params[:measurement_id])
    end

    def set_assessment
      @assessment = Assessment.find(params[:assessment_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params[:results]
    end
end
