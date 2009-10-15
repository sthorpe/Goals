class GoalsController < ApplicationController
  before_filter :login_required
  
  # GET /goals
  # GET /goals.xml
  def index
    @goals = Goals.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.xml
  def show
    @goals = Goals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/new
  # GET /goals/new.xml
  def new
    @goals = Goals.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1/edit
  def edit
    @goals = Goals.find(params[:id])
  end

  # POST /goals
  # POST /goals.xml
  def create
    @goals = Goals.new(params[:goals])

    respond_to do |format|
      if @goals.save
        flash[:notice] = 'Goals was successfully created.'
        format.html { redirect_to(@goals) }
        format.xml  { render :xml => @goals, :status => :created, :location => @goals }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goals.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.xml
  def update
    @goals = Goals.find(params[:id])

    respond_to do |format|
      if @goals.update_attributes(params[:goals])
        flash[:notice] = 'Goals was successfully updated.'
        format.html { redirect_to(@goals) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goals.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.xml
  def destroy
    @goals = Goals.find(params[:id])
    @goals.destroy

    respond_to do |format|
      format.html { redirect_to(goals_url) }
      format.xml  { head :ok }
    end
  end
end
