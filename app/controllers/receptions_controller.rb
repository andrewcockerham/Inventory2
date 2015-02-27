class ReceptionsController < ApplicationController
  before_action :set_reception, only: [:show, :edit, :update, :destroy]

  ## TO DO: figure out how to handle receiving new lot, is it under 'reciving'
  ##        and 'receptions', or under 'lots'?? do we need both?

  # GET /receptions
  # GET /receptions.json
  def index
    @receptions = Reception.all
  end

  # GET /receptions/1
  # GET /receptions/1.json
  def show
  end

  # GET /receptions/new
  def new
    @reception = Reception.new
  end

  # GET /receptions/1/edit
  def edit
  end

  # POST /receptions
  # POST /receptions.json
  def create
    @reception = Reception.new(reception_params)

    respond_to do |format|
      if @reception.save
        @purchase_order = PurchaseOrder.find(@reception.purchase_order_id)
        # if @purchase_order.quantities.find_by_item_id()
        if @purchase_order.quantities[0].amount_remaining
          @purchase_order.quantities[0].amount_remaining -= @reception.quantity
          @purchase_order.quantities[0].amount_received += @reception.quantity
          if @purchase_order.quantities[0].amount_received >= @purchase_order.quantities[0].amount
            @purchase_order.status = "Received"
          end
          @purchase_order.save
        end
        ## can receive something that doesn't have PO?
        ## TO DO: on new reception, choose po, then show list of items on that PO
        ## Update Item quantity "in inspection"
        i = Item.find(@purchase_order.quantities[0].item_id)
        i.in_inspection_qty += @reception.quantity
        ## Update Item "on order qty"
        i.on_order_qty -= @reception.quantity
        i.save

        p "update item in_inspection_qty"
        # p @purchase_order.quantities[0].amount_received
        p @reception.quantity

        format.html { redirect_to @reception, notice: 'Reception was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reception }
      else
        format.html { render action: 'new' }
        format.json { render json: @reception.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receptions/1
  # PATCH/PUT /receptions/1.json
  def update
    respond_to do |format|
      if @reception.update(reception_params)
        format.html { redirect_to @reception, notice: 'Reception was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reception.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receptions/1
  # DELETE /receptions/1.json
  def destroy
    @reception.destroy
    respond_to do |format|
      format.html { redirect_to receptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reception
      @reception = Reception.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reception_params
      params.require(:reception).permit(:date, :quantity, :description, :purchase_order_id)
    end
end
