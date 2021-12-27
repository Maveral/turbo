class RidersController < ApplicationController
  before_action :set_rider, only: %i[ show edit update destroy ]

  # GET /riders or /riders.json
  def index
    @riders = Rider.all
    @rider = Rider.new
  end

  # GET /riders/1 or /riders/1.json
  def show
    #redirect_to @rider
  end

  # GET /riders/new
  def new
    @rider = Rider.new
  end

  # GET /riders/1/edit
  def edit
  end

  # POST /riders or /riders.json
  def create
    @rider = Rider.new(rider_params)
    @rider.teams.build(rider_id: rider_params[:id], club_id: params[:rider][:club])

    respond_to do |format|
      if @rider.save
        format.html { redirect_to riders_path, notice: "Rider was successfully created." }
        format.json { render :show, status: :created, location: @rider }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@rider, partial: "riders/form", locals: { rider: @rider }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riders/1 or /riders/1.json
  def update
    @team = Team.where(rider_id: params[:id]).first

    respond_to do |format|
      if @team.update(club_id: params[:rider][:club]) && @rider.update(rider_params)
        format.html { redirect_to @rider, notice: "Rider was successfully updated." }
        format.json { render :show, status: :ok, location: @rider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1 or /riders/1.json
  def destroy
    @rider.destroy
    respond_to do |format|
      format.html { redirect_to riders_url, notice: "Rider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    if params[:query].present?
      @riders = Rider.where("name LIKE ? OR surename LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @riders = Rider.all
    end

    render turbo_stream: turbo_stream.update('riders', partial: @riders )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rider_params
      params.require(:rider).except(:club).permit(:name, :surename, :age, :id)
      #params.require(:rider).permit(:name, :surename, :age, :club)
    end
end
