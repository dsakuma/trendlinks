class ShortersController < ApplicationController
  # GET /shorters
  # GET /shorters.xml
  def index
    @shorters = Shorter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shorters }
    end
  end

  # GET /shorters/1
  # GET /shorters/1.xml
  def show
    @shorter = Shorter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shorter }
    end
  end

  # GET /shorters/new
  # GET /shorters/new.xml
  def new
    @shorter = Shorter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shorter }
    end
  end

  # GET /shorters/1/edit
  def edit
    @shorter = Shorter.find(params[:id])
  end

  # POST /shorters
  # POST /shorters.xml
  def create
    @shorter = Shorter.new(params[:shorter])

    respond_to do |format|
      if @shorter.save
        format.html { redirect_to(@shorter, :notice => 'Shorter was successfully created.') }
        format.xml  { render :xml => @shorter, :status => :created, :location => @shorter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shorter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shorters/1
  # PUT /shorters/1.xml
  def update
    @shorter = Shorter.find(params[:id])

    respond_to do |format|
      if @shorter.update_attributes(params[:shorter])
        format.html { redirect_to(@shorter, :notice => 'Shorter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shorter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shorters/1
  # DELETE /shorters/1.xml
  def destroy
    @shorter = Shorter.find(params[:id])
    @shorter.destroy

    respond_to do |format|
      format.html { redirect_to(shorters_url) }
      format.xml  { head :ok }
    end
  end
end
