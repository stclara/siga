class CadumsController < ApplicationController
  before_filter :require_user

  # GET /cadums
  # GET /cadums.xml
  def index
    @cadums = Cadum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cadums }
    end
  end

  # GET /cadums/1
  # GET /cadums/1.xml
  def show
    @cadum = Cadum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cadum }
    end
  end

  # GET /cadums/new
  # GET /cadums/new.xml
  def new
    @cadum = Cadum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cadum }
    end
  end

  # GET /cadums/1/edit
  def edit
    @cadum = Cadum.find(params[:id])
  end

  # POST /cadums
  # POST /cadums.xml
  def create
    @cadum = Cadum.new(params[:cadum])

    respond_to do |format|
      if @cadum.save
        flash[:notice] = 'Cadum was successfully created.'
        format.html { redirect_to(@cadum) }
        format.xml  { render :xml => @cadum, :status => :created, :location => @cadum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cadum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cadums/1
  # PUT /cadums/1.xml
  def update
    @cadum = Cadum.find(params[:id])

    respond_to do |format|
      if @cadum.update_attributes(params[:cadum])
        flash[:notice] = 'Cadum was successfully updated.'
        format.html { redirect_to(@cadum) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cadum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cadums/1
  # DELETE /cadums/1.xml
  def destroy
    @cadum = Cadum.find(params[:id])
    @cadum.destroy

    respond_to do |format|
      format.html { redirect_to(cadums_url) }
      format.xml  { head :ok }
    end
  end
end
