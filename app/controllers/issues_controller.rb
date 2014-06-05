class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
<<<<<<< HEAD
    @issues = Issue.all
=======
    if curren_user.rol="Usuario" 
      @issues = Issue.where(thermostat_id: params[:thermostat_id])
    else
      @issues = Issue.where('status != ?' "ABIERTO")
    end
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

<<<<<<< HEAD
  # GET /issues/new
  def new
    @thermostat_id = params[:id]
    @issue = Issue.new 
=======

  # GET /issues/new
  def new
    @issue = Issue.new
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
=======
  def cancel
    @issue=Issue.find(params[:id])
    @issue.status='CANCELADO'
    @issue.save
    redirect_to('/issues')
  end

>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
=======
  def resolve
    @issue=Issue.find(params[:id])
  end

  def solve
    @issue=Issue.find(params[:id])
    @issue.update(solve_params)
  end

>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

<<<<<<< HEAD
  def create_issue
    @issue = Issue.new
    @issue.thermostat_id = params[:thermostat_id]
    @issue.description = params[:description]
    @issue.save
    redirect_to '/locations'

  end

  def issues_thermostat_list
    @issues = Issue.where(:thermostat_id => params[:id])
  end

  def cancel_issues_thermostat
    @my_issue = Issue.find(params[:id])
    @my_issue.state = "CANCELADO"
    @my_issue.save
    redirect_to '/locations'
  end

  def resolve_issue
    @my_issue = Issue.find(params[:id])
  end

  def save_resolve_issue
    @my_issue = Issue.find(params[:issue_id])
    @my_issue.state = "RESUELTO"
    @my_issue.resolution = params[:answer]
    @my_issue.save
    redirect_to '/issues'
  end

  def open_issue
    @my_issue = Issue.find(params[:id])
    @my_issue.state = "ABIERTO"
    @my_issue.save
    redirect_to '/issues'
  end

=======
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
<<<<<<< HEAD
      params.require(:issue).permit(:description, :state, :resolution, :thermostat_id)
=======
      params.require(:issue).permit(:thermostat_id, :description, :status, :resolution)
    end
     def solv_params
      params.require(:issue).permit(:status, :resolution)
>>>>>>> 14ec02d6ab8edcf7325845df6814134b1178ee8a
    end
end
