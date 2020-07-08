class UrgeForsController < ApplicationController
  before_action :set_urge_for, only: [:show, :edit, :update, :destroy]

  # GET /urge_fors
  # GET /urge_fors.json
  def index
    @urge_fors = UrgeFor.all
  end

  # GET /urge_fors/1
  # GET /urge_fors/1.json
  def show
  end

  # GET /urge_fors/new
  def new
    @urge_for = UrgeFor.new
  end

  # GET /urge_fors/1/edit
  def edit
  end

  # POST /urge_fors
  # POST /urge_fors.json
  def create
    @urge_for = UrgeFor.new(urge_for_params)

    respond_to do |format|
      if @urge_for.save
        format.html { redirect_to @urge_for, notice: 'Urge for was successfully created.' }
        format.json { render :show, status: :created, location: @urge_for }
      else
        format.html { render :new }
        format.json { render json: @urge_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urge_fors/1
  # PATCH/PUT /urge_fors/1.json
  def update
    respond_to do |format|
      if @urge_for.update(urge_for_params)
        format.html { redirect_to @urge_for, notice: 'Urge for was successfully updated.' }
        format.json { render :show, status: :ok, location: @urge_for }
      else
        format.html { render :edit }
        format.json { render json: @urge_for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urge_fors/1
  # DELETE /urge_fors/1.json
  def destroy
    @urge_for.destroy
    respond_to do |format|
      format.html { redirect_to urge_fors_url, notice: 'Urge for was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urge_for
      @urge_for = UrgeFor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urge_for_params
      params.require(:urge_for).permit(:urge)
    end
end
