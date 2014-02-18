class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @q = Quantity.all.find_all_by_purchase_order_id(@purchase_order.id)
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @todays_date = Date.today.to_s.delete("-")
    if PurchaseOrder.first
      @last_date = PurchaseOrder.last.purchase_order_number.split("-")[0]
      @last_number = PurchaseOrder.last.purchase_order_number.split("-")[1]
    end
    if @last_date == @todays_date
      @next_po_number = @todays_date + "-" + "0" + (@last_number.to_i + 1).to_s
    else
      @next_po_number = @todays_date + "-01"
    end
    @purchase_order.purchase_order_number = @next_po_number
    @purchase_order.quantities.build

    # create list of items for quantites partial
    @item_list = Item.all.order(:part_number)
    # @item_list = Item.where('student_advisor' => true) 
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        @purchase_order.quantities.each do |quantity|
          @item = Item.find(quantity.item_id)
          @item.on_order_qty += quantity.amount
          @item.save
        end
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @purchase_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to purchase_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:date, :purchase_order_number, :cost, :description, :estimated_arrival,
                                             :supplier_id, :supplier => [:id, :supplier_id],
                                             :suppliers => [:id, :supplier_id],
                                             :supplier_ids => [:id, :supplier_id],
                                             :supplier_attributes => [:id, :supplier_id],
                                             :items => [:id, :item_id],
                                             :item_ids => [:id, :item_id], :quantity => [],
                                             :item_attributes => [:id, :item_id], 
                                             :quantities_attributes => [:amount, :id, :item_id, :_destroy],
                                             :quantity_ids => [],
                                             :suppliers => [:id, :supplier_id],
                                             :supplier_ids => []) # this one worked!!!
    end                                     # :item_id,
end
