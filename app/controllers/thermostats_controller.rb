class ThermostatsController < ApplicationController
  #before_action :set_thermostat, only: [:show, :edit, :update, :destroy]
   before_action :load_location 
  # GET /thermostats
  # GET /thermostats.json
  skip_before_filter :verify_authenticity_token

  def index
    @thermostats = Thermostat.all
  end

  # GET /thermostats/1
  # GET /thermostats/1.json
  def show
      @thermostat=Thermostat.find(params[:id])
      @thermostat_history= ThermostatHistory.where(thermostat: @thermostat).last
  end 

  # GET /thermostats/new
  def new
    @thermostat = Thermostat.new
  end

  # GET /thermostats/1/edit
  def edit
  end
  def set_temperatures
    @thermostat=Thermostat.find(params[:id])
    @thermostat.temperature = params[:temperature]
    if @thermostat.update(temperature_params)
      redirect_to('/')
    else
      redirect_to('/locations/'+@thermostat.location.id.to_s+'/thermostats/config_temp/'+@thermostat.id.to_s)
    end
  end


  # POST /thermostats
  # POST /thermostats.json
  def create
    @thermostat = @location.thermostats.new(thermostat_params)
   respond_to do |format|
      if @thermostat.save
        format.html { redirect_to :controller => 'schedules', :action => 'new', :id => @thermostat.id}
        #format.html { redirect_to locations_path, notice: 'Thermostat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thermostat }
      else
        format.html { render action: 'new' }
        format.json { render json: @thermostat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thermostats/1
  # PATCH/PUT /thermostats/1.json
  def update
    respond_to do |format|
      if @thermostat.update(thermostat_params)
        format.html { redirect_to @thermostat, notice: 'Thermostat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thermostat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thermostats/1
  # DELETE /thermostats/1.json
  def destroy
    @thermostat.destroy
    respond_to do |format|
      format.html { redirect_to thermostats_url }
      format.json { head :no_content }
    end
  end

  def configure_temperatures
    @thermostat = Thermostat.find(params[:id])
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_thermostat
    #  @thermostat = Thermostat.find(params[:id])
    #end
  def load_location
      @location = Location.find(params[:location_id])
      #@thermostat = Thermostat.find(params[:id])
  end
    # Never trust parameters from the scary internet, only allow the white list through.
  def thermostat_params
    params.require(:thermostat).permit(:serial_number, :location_id,:place, :temperature, :configuration)
  end

  def temperature_params
     params.require(:thermostat).permit(:temperature, :configuration)

  end

  #def show_configureTemp
  #   @thermostat = Post.find(params[:id])
  #end


end

