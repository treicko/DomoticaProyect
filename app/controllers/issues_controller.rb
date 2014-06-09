class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @thermostat_id = params[:id]
    @issue = Issue.new 
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

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to '/locations' }
      format.json { head :no_content }
    end
  end

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
    respond_to do |format|
      if @my_issue.save
        #format.html { redirect_to '/', notice: 'Liked'}
        format.json {render json:{:state => @my_issue.state}}
      else
        #format.html { redirect_to '/', notice: 'Error' }
        format.json {render json:{:errors => @my_issue.errors}}
      end
    end
  end

  def resolve_issue
    @my_issue = Issue.find(params[:id])
  end

  def save_resolve_issue
    #@issue.update(solve_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:description, :state, :resolution, :thermostat_id)
    end
end
