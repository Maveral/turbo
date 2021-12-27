class MechanicsController < ApplicationController
  before_action :set_mechanic, only: %i[ show edit update destroy ]

  # GET /mechanics or /mechanics.json
  def index
    @mechanics = Mechanic.all
  end

  # GET /mechanics/1 or /mechanics/1.json
  def show
  end

  # GET /mechanics/new
  def new
    @mechanic = Mechanic.new
  end

  # GET /mechanics/1/edit
  def edit
  end

  # POST /mechanics or /mechanics.json
  def create
    @mechanic = Mechanic.new(mechanic_params)

    respond_to do |format|
      if @mechanic.save
        format.html { redirect_to @mechanic, notice: "Mechanic was successfully created." }
        format.json { render :show, status: :created, location: @mechanic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mechanic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mechanics/1 or /mechanics/1.json
  def update
    respond_to do |format|
      if @mechanic.update(mechanic_params)
        format.html { redirect_to @mechanic, notice: "Mechanic was successfully updated." }
        format.json { render :show, status: :ok, location: @mechanic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mechanic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanics/1 or /mechanics/1.json
  def destroy
    @mechanic.destroy
    respond_to do |format|
      format.html { redirect_to mechanics_url, notice: "Mechanic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanic
      @mechanic = Mechanic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mechanic_params
      params.require(:mechanic).permit(:name, :surname, :age, :experience, :rider_id)
    end
end
