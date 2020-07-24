class UrgesController < ApplicationController
  before_action :set_urge, only: [:show, :edit, :update, :destroy]

  # GET /urges
  # GET /urges.json
  def index
    @urges = Urge.all.order(datetime: :desc)
    @since_last = Urge.since_last
  end

  # GET /urges/1
  # GET /urges/1.json
  def show
  end

  # GET /urges/new
  def new
    @urge = Urge.new
  end

  # GET /urges/1/edit
  def edit
  end

  # POST /urges
  # POST /urges.json
  def create
    @urge = Urge.new(urge_params)

    respond_to do |format|
      if @urge.save
        format.html { redirect_to :urges, notice: 'Urge was successfully created.' }
        format.json { render :show, status: :created, location: @urge }
      else
        format.html { render :new }
        format.json { render json: @urge.errors, status: :unprocessable_entity }
      end
    end
  end

  def quick_create
    @urge = Urge.new(datetime: Time.now, urge_for_id: params[:urge_for_id])
    @urge.save
    
    respond_to do |format|
      if @urge.save
        format.html { redirect_back fallback_location: :urges, notice: 'Urge was successfully created.' }
        format.json { render :show, status: :created, location: @urge }
      else
        format.html { render :new }
        format.json { render json: @urge.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to :urges
  end

  # PATCH/PUT /urges/1
  # PATCH/PUT /urges/1.json
  def update
    respond_to do |format|
      if @urge.update(urge_params)
        format.html { redirect_to @urge, notice: 'Urge was successfully updated.' }
        format.json { render :show, status: :ok, location: @urge }
      else
        format.html { render :edit }
        format.json { render json: @urge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urges/1
  # DELETE /urges/1.json
  def destroy
    @urge.destroy
    respond_to do |format|
      format.html { redirect_to urges_url, notice: 'Urge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urge
      @urge = Urge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urge_params
      params.require(:urge).permit(:datetime, :date, :urge_for_id, :notes)
    end
end
