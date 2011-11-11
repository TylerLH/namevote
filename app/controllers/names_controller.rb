class NamesController < ApplicationController
  # GET /names
  # GET /names.json
  def index
    @names = Name.paginate(:page => params[:page], :per_page => 20, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @names }
    end
  end

  # Top 10 List
  def topten
    @names = Name.find(:all, :order => "votes DESC", :limit => 10, :conditions => ["status = ?", "active"])

    respond_to do |format|
      format.html # topten.html.erb
      format.json { render json: @names }
    end
  end

  # GET /names/1
  # GET /names/1.json
  def show
    @name = Name.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @name }
    end
  end

  # GET /names/new
  # GET /names/new.json
  def new
    @name = Name.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @name }
    end
  end

  # GET /names/1/edit
  def edit
    @name = Name.find(params[:id])
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(:name => params[:name])

    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, notice: 'Name was successfully created.' }
        format.json { render json: @name, status: :created, location: @name }
      else
        format.html { render action: "new" }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # Vote up a name
  # POST /vote/:id
  def vote
    @name = Name.find(params[:id])
    @name.votes += 1

    respond_to do |format|
      if @name.save
        format.html { redirect_to :back, notice: 'Your vote has been counted!'}
        format.json { head :ok }
      else
        format.html { redirect_to root_path, notice: "Couldn't add vote!"}
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /names/1
  # PUT /names/1.json
  def update
    @name = Name.find(params[:id])

    respond_to do |format|
      if @name.update_attributes(params[:name])
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name = Name.find(params[:id])
    @name.destroy

    respond_to do |format|
      format.html { redirect_to names_url }
      format.json { head :ok }
    end
  end
end
