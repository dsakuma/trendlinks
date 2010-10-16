class CurrentsController < ApplicationController
  # GET /currents
  # GET /currents.xml
  def index
    @currents = Current.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currents }
    end
  end

  # GET /currents/1
  # GET /currents/1.xml
  def show
    @current = Current.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @current }
    end
  end

  # GET /currents/new
  # GET /currents/new.xml
  def new
    @current = Current.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @current }
    end
  end

  # GET /currents/1/edit
  def edit
    @current = Current.find(params[:id])
  end

  # POST /currents
  # POST /currents.xml
  def create
    @current = Current.new(params[:current])

    respond_to do |format|
      if @current.save
        format.html { redirect_to(@current, :notice => 'Current was successfully created.') }
        format.xml  { render :xml => @current, :status => :created, :location => @current }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @current.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currents/1
  # PUT /currents/1.xml
  def update
    @current = Current.find(params[:id])

    respond_to do |format|
      if @current.update_attributes(params[:current])
        format.html { redirect_to(@current, :notice => 'Current was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @current.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /currents/1
  # DELETE /currents/1.xml
  def destroy
    @current = Current.find(params[:id])
    @current.destroy

    respond_to do |format|
      format.html { redirect_to(currents_url) }
      format.xml  { head :ok }
    end
  end
end
