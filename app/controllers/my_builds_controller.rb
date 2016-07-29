class MyBuildsController < ApplicationController
  before_action :set_my_build, only: [:show, :edit, :update, :destroy]

  # GET /my_builds
  # GET /my_builds.json
  def index
    @my_builds = MyBuild.order("ship_date desc")
  end

  # GET /my_builds/1
  # GET /my_builds/1.json
  def show
  end

  # GET /my_builds/new
  def new
    @my_build = MyBuild.new
  end

  # GET /my_builds/1/edit
  def edit
  end

  # POST /my_builds
  # POST /my_builds.json
  def create
    @my_build = MyBuild.new(my_build_params)
    @my_build.complete = false if @my_build.complete.nil?
    @my_build.current = false if @my_build.current.nil?

    respond_to do |format|
      if @my_build.save
        format.html { redirect_to @my_build, notice: 'My build was successfully created.' }
        format.json { render action: 'show', status: :created, location: @my_build }
      else
        format.html { render action: 'new' }
        format.json { render json: @my_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_builds/1
  # PATCH/PUT /my_builds/1.json
  def update
    respond_to do |format|
      if @my_build.update(my_build_params)
        format.html { redirect_to @my_build, notice: 'My build was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @my_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_builds/1
  # DELETE /my_builds/1.json
  def destroy
    @my_build.destroy
    respond_to do |format|
      format.html { redirect_to my_builds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_build
      @my_build = MyBuild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_build_params
      params.require(:my_build).permit(:start_qty, :scrap_qty, :description, :start_date, :ship_date, :complete, :current)
    end
end
