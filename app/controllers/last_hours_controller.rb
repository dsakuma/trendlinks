class LastHoursController < ApplicationController
  # GET /last_hours
  # GET /last_hours.xml
  def index
    @last_hours = LastHour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @last_hours }
    end
  end

  # GET /last_hours/1
  # GET /last_hours/1.xml
  def show
    @last_hour = LastHour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @last_hour }
    end
  end

  # GET /last_hours/new
  # GET /last_hours/new.xml
  def new
    @last_hour = LastHour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @last_hour }
    end
  end

  # GET /last_hours/1/edit
  def edit
    @last_hour = LastHour.find(params[:id])
  end

  # POST /last_hours
  # POST /last_hours.xml
  def create
    @last_hour = LastHour.new(params[:last_hour])

    respond_to do |format|
      if @last_hour.save
        format.html { redirect_to(@last_hour, :notice => 'LastHour was successfully created.') }
        format.xml  { render :xml => @last_hour, :status => :created, :location => @last_hour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @last_hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /last_hours/1
  # PUT /last_hours/1.xml
  def update
    @last_hour = LastHour.find(params[:id])

    respond_to do |format|
      if @last_hour.update_attributes(params[:last_hour])
        format.html { redirect_to(@last_hour, :notice => 'LastHour was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @last_hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /last_hours/1
  # DELETE /last_hours/1.xml
  def destroy
    @last_hour = LastHour.find(params[:id])
    @last_hour.destroy

    respond_to do |format|
      format.html { redirect_to(last_hours_url) }
      format.xml  { head :ok }
    end
  end
end
