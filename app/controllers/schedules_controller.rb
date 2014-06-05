class SchedulesController < ApplicationController
#  before_action :set_schedule, only: [:new, :show, :edit, :update, :destroy]
# before_action :load_thermostat
  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show

        #@lista = Schedule.where(:thermostat_id => params[:id])
 
        @id_temperature = Schedule.where(day: "LUNES", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:m12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "LUNES", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:m13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "LUNES", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:m14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "LUNES", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:m15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "LUNES", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:m16]], :id => @id_temperature)        


        @id_temperature = Schedule.where(day: "MARTES", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:tu12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MARTES", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:tu13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MARTES", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:tu14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MARTES", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:tu15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MARTES", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:tu16]], :id => @id_temperature)        


        @id_temperature = Schedule.where(day: "MIERCOLES", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:w12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MIERCOLES", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:w13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MIERCOLES", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:w14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MIERCOLES", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:w15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "MIERCOLES", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:w16]], :id => @id_temperature)        


        @id_temperature = Schedule.where(day: "JUEVES", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:th12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "JUEVES", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:th13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "JUEVES", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:th14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "JUEVES", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:th15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "JUEVES", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:th16]], :id => @id_temperature)        


        @id_temperature = Schedule.where(day: "VIERNES", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:f12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "VIERNES", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:f13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "VIERNES", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:f14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "VIERNES", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:f15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "VIERNES", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:f16]], :id => @id_temperature)        
        


        @id_temperature = Schedule.where(day: "SABADO", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:sa12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "SABADO", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:sa13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "SABADO", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:sa14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "SABADO", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:sa15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "SABADO", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:sa16]], :id => @id_temperature)        


        @id_temperature = Schedule.where(day: "DOMINGO", time: "2014-05-28 16:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:su12]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "DOMINGO", time: "2014-05-28 17:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:su13]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "DOMINGO", time: "2014-05-28 18:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:su14]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "DOMINGO", time: "2014-05-28 19:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:su15]], :id => @id_temperature)        
 
        @id_temperature = Schedule.where(day: "DOMINGO", time: "2014-05-28 20:00:00.000000", thermostat_id: params[:parent_id]).first.id
        Schedule.update_all(["temperature = ?", params[:su16]], :id => @id_temperature)       



       redirect_to locations_path
        #@schedule.update_attributes(:temperature => "params[:m12]")
        #Schedule.update_all(["temperature = ?", params[:m12]], :id => @id_temperature)
        #Schedule.update_all(["temperature = ?", params[:m12]], :id => params[:m12])
        #@schedule =Schedule.find(params[:m12])     
        #@schedule = Schedule.where(:thermostat_id => "27")
        #@schedule.day = "params[:m12]"            
        #@schedule.update_attributes(:temperature => params[:m12])
  end

  # GET /schedules/new
  def new
    @thermostat = Thermostat.find(params[:id])

    @schedule = Schedule.new
    @schedule.day = 'LUNES'
    @schedule.time = "2014-05-28 12:00:00.000000"
    @schedule.temperature = 250
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'LUNES'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 250
    @schedule.thermostat_id = @thermostat.id
    @schedule.save  
      
    @schedule = Schedule.new
    @schedule.day = 'LUNES'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 250
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'LUNES'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 250
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'LUNES'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 250
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MARTES'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MARTES'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MARTES'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MARTES'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MARTES'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MIERCOLES'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MIERCOLES'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MIERCOLES'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MIERCOLES'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'MIERCOLES'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'JUEVES'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save
    
    @schedule = Schedule.new
    @schedule.day = 'JUEVES'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'JUEVES'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'JUEVES'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'JUEVES'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'VIERNES'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'VIERNES'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'VIERNES'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'VIERNES'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'VIERNES'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'SABADO'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'SABADO'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'SABADO'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'SABADO'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'SABADO'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'DOMINGO'
    @schedule.time = "2014-05-28 12:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'DOMINGO'
    @schedule.time = "2014-05-28 13:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'DOMINGO'
    @schedule.time = "2014-05-28 14:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'DOMINGO'
    @schedule.time = "2014-05-28 15:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save

    @schedule = Schedule.new
    @schedule.day = 'DOMINGO'
    @schedule.time = "2014-05-28 16:00:00"
    @schedule.temperature = 25
    @schedule.thermostat_id = @thermostat.id
    @schedule.save
    
    redirect_to locations_path
  end

  # GET /schedules/1/edit
  def edit
    #redirect_to  action: 'show', id: 60 
    @agenda = Schedule.where(:thermostat_id => params[:id])
    @thermostat = Thermostat.find(params[:id])
    @lista = Schedule.where(:thermostat_id => params[:id]).all
    
    @id_thermostat =@lista.first.thermostat_id
       
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to locations_path } 
        #format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule }
      else
        format.html { render action: 'new' }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end


 def load_thermostat
    @thermostat = Thermostat.find(params[:thermostat_id])
    #@thermostat = Thermostat.find(params[:id])

  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:day, :time, :temperature, :thermostat_id)
    end


end
