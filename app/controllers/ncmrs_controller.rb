class NcmrsController < ApplicationController
  before_action :set_ncmr, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ncmrs = Ncmr.all
    respond_with(@ncmrs)
  end

  def show
    respond_with(@ncmr)
  end

  def new
    @ncmr = Ncmr.new
    respond_with(@ncmr)
  end

  def edit
  end

  def create
    @ncmr = Ncmr.new(ncmr_params)
    @ncmr.save
    respond_with(@ncmr)
  end

  def update
    @ncmr.update(ncmr_params)
    respond_with(@ncmr)
  end

  def destroy
    @ncmr.destroy
    respond_with(@ncmr)
  end

  private
    def set_ncmr
      @ncmr = Ncmr.find(params[:id])
    end

    def ncmr_params
      params.require(:ncmr).permit(:number)
    end
end
