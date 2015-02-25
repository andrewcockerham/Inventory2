class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  ### my custon methods
  # GET /inspection
  def inspection
    @inspection_queue = Lot.where("status = ?", "Inspection")
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Used', 4]]
  end

  # def inspection_post ??

  # end

  def release
    @lot = Lot.find(params[:id])
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Used', 4]]
  end

  def receiving_log
    @lots = Lot.all
    redirect_to lots_path
  end

  def sonication
    @lots = Lot.where("cleaned = ? AND accepted_qty > ?", false, 0)
  end

  def pull
    @lot = Lot.find(params[:id])
    @lot.build_lots.build
      ### want to use the new created .build one, not show the old one
  end

  ### END MY CUSTOM METHODS

  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.order("number desc")
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
  end

  # GET /lots/new
  def new
    @lot = Lot.new
    @lot.inventory_qty = 0
    @lot.accepted_qty = 0
    if Lot.first
      @lot.number = Lot.last.number + 1
    else
      @lot.number = 500
    end
    # @status_list = %w[Inspection NCMR Inventory Used]
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Used', 4]]
  end

  # GET /lots/1/edit
  def edit
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Used', 4]]
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Used', 4]]
    @lot.inventory_qty = 0
    respond_to do |format|
      if @lot.save
        ### make sure to put error checks so you can't receive more than was ordered or get a negative number
        @po = PurchaseOrder.find(@lot.purchase_order_id)
        # @lot.received_qty == params 0
        @lot.accepted_qty = 0
        @lot.save
        if params["full_po_checkbox"]["full_po_qty"] == 1
          @lot.received_qty = @po.quantities.find_by_item_id(@lot.item_id).amount
          @lot.inventory_qty = @lot.received_qty
          @lot.save
        end

        # @po.quantities.find_by_item_id(@lot.item_id).amount -= @lot.received_qty
        ### THERE IS A BUG HERE IF A PO HAS MULTIPLE ITEMS
        @po.status = "Received" if @po.quantities.find_by_item_id(@lot.item_id).amount == @lot.received_qty && @po.quantities.length == 1
        puts 'po status'
        @po.save

        @item = Item.find(@lot.item_id)
        @item.on_order_qty -= @lot.received_qty if @lot.received_qty
        @item.in_inspection_qty += @lot.received_qty
        @item.save

        @quantity = @po.quantities.find_by_item_id(@lot.item_id)
        @quantity.amount_received += @lot.received_qty
        @quantity.amount_remaining -= @quantity.amount_received
        @quantity.save

        format.html { redirect_to @lot, notice: 'Lot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lot }
      else
        format.html { render action: 'new' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update

    respond_to do |format|
      if @lot.update(lot_params)
        # if @lot.cleaned
        if params["lot"]["cleaned"] == "1"
          @item = Item.find(@lot.item_id)
          @item.stock_qty += @lot.accepted_qty if @lot.accepted_qty
          @item.save
        end

        # check for hidden field 'inpsection', if yes
        # add accepted_qty to inventory_qty
        if params["lot"]["accepted_qty"].to_i > 0
          @item = Item.find(@lot.item_id)
          # @item.stock_qty += @lot.accepted_qty
          @item.in_inspection_qty -= @lot.accepted_qty
          @item.stock_qty += @lot.accepted_qty
          @item.save
          @lot.inventory_qty += @lot.accepted_qty
          @lot.save
        end

        ### from 'pull' page
        if params["lot"]["build_lots_attributes"] #["0"]["pull_quantity"]
          # line 139 is a bug b/c second time you pull, it will still subtract the pulled amount from the first pull
          @lot.inventory_qty -= params["lot"]["build_lots_attributes"]["0"]["pull_quantity"].to_i
          @lot.save
          @item = Item.find(@lot.item_id)
          @item.stock_qty -= params["lot"]["build_lots_attributes"]["0"]["pull_quantity"].to_i
          @item.save
        end
        p "employee_id"
        p params["lot"]["build_lots_attributes"]#["employee_id"]
        # p params["lot"]["build_lots_attributes"].last
        p params["lot"]["build_lots_attributes"].length
        p params["lot"]["build_lots_attributes"][(params["lot"]["build_lots_attributes"].length - 1).to_s]

        format.html { redirect_to @lot, notice: 'Lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit(:number, :received_qty, :inventory_qty, :item_id, :cleaned, :status,
                                  :purchase_order_id, :received_date, :full_po_qty, :accepted_qty, :rejected_qty, :date_cleaned,
                                  :build_lots_attributes => [:pull_quantity, :id, :my_build_id, :lot_id, :_destroy],
                                  :build_lot_ids => [])
    end
end
