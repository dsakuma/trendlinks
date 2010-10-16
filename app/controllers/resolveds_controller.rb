class ResolvedsController < ApplicationController
  # GET /resolveds
  # GET /resolveds.xml
  def index
    @resolveds = Resolved.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resolveds }
    end
  end

  # GET /resolveds/1
  # GET /resolveds/1.xml
  def show
    @resolved = Resolved.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resolved }
    end
  end

  # GET /resolveds/new
  # GET /resolveds/new.xml
  def new
    @resolved = Resolved.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resolved }
    end
  end

  # GET /resolveds/1/edit
  def edit
    @resolved = Resolved.find(params[:id])
  end

  # POST /resolveds
  # POST /resolveds.xml
  def create
    @resolved = Resolved.new(params[:resolved])

    respond_to do |format|
      if @resolved.save
        format.html { redirect_to(@resolved, :notice => 'Resolved was successfully created.') }
        format.xml  { render :xml => @resolved, :status => :created, :location => @resolved }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resolved.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resolveds/1
  # PUT /resolveds/1.xml
  def update
    @resolved = Resolved.find(params[:id])

    respond_to do |format|
      if @resolved.update_attributes(params[:resolved])
        format.html { redirect_to(@resolved, :notice => 'Resolved was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resolved.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resolveds/1
  # DELETE /resolveds/1.xml
  def destroy
    @resolved = Resolved.find(params[:id])
    @resolved.destroy

    respond_to do |format|
      format.html { redirect_to(resolveds_url) }
      format.xml  { head :ok }
    end
  end
end
