class SmokesController < ApplicationController
  before_action :set_smoke, only: [:show, :edit, :update, :destroy]

  # GET /smokes
  # GET /smokes.json
  def index
    @smokes = Smoke.all.order(datetime: :desc)
    @since_last = Smoke.since_last
  end

  # GET /smokes/1
  # GET /smokes/1.json
  def show
  end

  # GET /smokes/new
  def new
    @smoke = Smoke.new
  end

  # GET /smokes/1/edit
  def edit
  end

  # POST /smokes
  # POST /smokes.json
  def create
    @smoke = Smoke.new(smoke_params)

    respond_to do |format|
      if @smoke.save
        format.html { redirect_to :smokes, notice: 'Smoke was successfully created.' }
        format.json { render :show, status: :created, location: @smoke }
      else
        format.html { render :new }
        format.json { render json: @smoke.errors, status: :unprocessable_entity }
      end
    end
  end

  def quick_create
    @smoke = Smoke.new(datetime: Time.now, what: params[:what_was_smoked])
    @smoke.save
    
    respond_to do |format|
      if @smoke.save
        format.html { redirect_back fallback_location: :smokes, notice: 'Smoke was successfully created.' }
        format.json { render :show, status: :created, location: @smoke }
      else
        format.html { render :new }
        format.json { render json: @smoke.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulk_create_form

    if params[:commit].nil?
      #
    else
      puts "\n\n\n********\n\n\n\n"
      @year =  params[:date]["(1i)"].to_i
      @month =  params[:date]["(2i)"].to_i
      @day =  params[:date]["(3i)"].to_i
      @num = params[:qty][0].to_i
      @what = params[:what_was_smoked]

      @num.times {
        @rand_time = DateTime.new( @year, @month, @day, rand(7..22), rand(2..58) )
        Smoke.new(datetime: @rand_time, date: @rand_time.to_date, what: @what).save
      }

      redirect_to :smokes
    end

  end

  # PATCH/PUT /smokes/1
  # PATCH/PUT /smokes/1.json
  def update
    respond_to do |format|
      if @smoke.update(smoke_params)
        format.html { redirect_to @smoke, notice: 'Smoke was successfully updated.' }
        format.json { render :show, status: :ok, location: @smoke }
      else
        format.html { render :edit }
        format.json { render json: @smoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smokes/1
  # DELETE /smokes/1.json
  def destroy
    @smoke.destroy
    respond_to do |format|
      format.html { redirect_to smokes_url, notice: 'Smoke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smoke
      @smoke = Smoke.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smoke_params
      params.require(:smoke).permit(:datetime, :date, :what, :notes)
    end
end
