class LastIdsController < ApplicationController
  # GET /last_ids
  # GET /last_ids.xml
  def index
    @last_ids = LastId.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @last_ids }
    end
  end

  # GET /last_ids/1
  # GET /last_ids/1.xml
  def show
    @last_id = LastId.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @last_id }
    end
  end

  # GET /last_ids/new
  # GET /last_ids/new.xml
  def new
    @last_id = LastId.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @last_id }
    end
  end

  # GET /last_ids/1/edit
  def edit
    @last_id = LastId.find(params[:id])
  end

  # POST /last_ids
  # POST /last_ids.xml
  def create
    @last_id = LastId.new(params[:last_id])

    respond_to do |format|
      if @last_id.save
        format.html { redirect_to(@last_id, :notice => 'LastId was successfully created.') }
        format.xml  { render :xml => @last_id, :status => :created, :location => @last_id }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @last_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /last_ids/1
  # PUT /last_ids/1.xml
  def update
    @last_id = LastId.find(params[:id])

    respond_to do |format|
      if @last_id.update_attributes(params[:last_id])
        format.html { redirect_to(@last_id, :notice => 'LastId was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @last_id.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /last_ids/1
  # DELETE /last_ids/1.xml
  def destroy
    @last_id = LastId.find(params[:id])
    @last_id.destroy

    respond_to do |format|
      format.html { redirect_to(last_ids_url) }
      format.xml  { head :ok }
    end
  end
end
