class LotsController < ApplicationController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  ## TO DO:
  ## make inventory qty just sum of all lots?? instead of value of item?

  ## TODO
  ## add column for whether an item requires cleaning to Item....
  ## => then only show date.cleaned if item requires cleaning
  ## => i.e. shafts don't require cleaning, so shouldn't show option to
  ## => mark as cleaned or date_cleaned

  ### START CUSTOM METHODS
  # GET /inspection
  def inspection
    @inspection_queue = Lot.where("status = ?", "Inspection")
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]
  end

  # def inspection_post ??

  # end

  def release
    @lot = Lot.find(params[:id])
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]
  end

  def receiving_log
    @lots = Lot.all
    redirect_to lots_path
  end

  def sonication
    @lots = Lot.where("cleaned = ? AND accepted_qty > ?", false, 0)
  end

  def pull
    @lot = Lot.where(id: params[:id]).first
    # @lot = Lot.find(params[:id])
    @lot.build_lots.build
    @reverseBuildLots = @lot.build_lots.reverse
      ### want to use the new created .build one, not show the old one
  end

  ### END CUSTOM METHODS

  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.order("number desc")
    @items = Item.all
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
    @lot.received_qty = 0
    if Lot.first
      @lot.number = Lot.last.number + 1
    else
      @lot.number = 500
    end
    # @status_list = %w[Inspection NCMR Inventory Exhausted]
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]
  end

  # GET /lots/1/edit
  def edit
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = Lot.new(lot_params)
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]
    @lot.inventory_qty = 0
    respond_to do |format|
      if @lot.save
        ### make sure to put error checks so you can't receive get a negative number
        @po = @lot.purchase_order
        @lot.accepted_qty = 0
        # @lot.received_qty = 0
        @lot.save
        # if params["lot"]
          # if params["full_po_checkbox"]["full_po_qty"] == "1"
          # if params["lot"]["full_po_checkbox"]["full_po_qty"] == "1"
            # @lot.full_po_qty = true
            # THIS IS FOR 'FULL PO'...@lot.received_qty = @po.quantities.where(item_id: @lot.item_id).first.amount
            # @lot.inventory_qty = @lot.received_qty
            # @lot.save
          # end
        # else
          # if params["full_po_checkbox"]["full_po_qty"] == "1"
            # @lot.full_po_qty = true
        #     @lot.received_qty = @po.quantities.find_by_item_id(@lot.item_id).amount
        #     @lot.inventory_qty = @lot.received_qty
        #     @lot.save
        #   # end
        # end

        ## if 'cleaned' checkbox checked, set cleaned=true and set date_cleaned=today
        ## TODO add ability to change/edit date that was cleaned,
        ##      or input a different date for date cleaned
        if params["lot"]["cleaned"] == 1
          @lot.cleaned = true
          @lot.date_cleaned = Date.today
          @lot.save
        end

        # @po.quantities.find_by_item_id(@lot.item_id).amount -= @lot.received_qty
        ### TO DO: THERE IS A BUG HERE IF A PO HAS MULTIPLE ITEMS
        @po.status = true if @po.quantities.find_by_item_id(@lot.item_id).amount == @lot.received_qty && @po.quantities.length == 1
        p 'po status'
        p @po.status
        @po.save

        @item = Item.where(id: @lot.item_id).first # use .first because .where returns an array
        @item.on_order_qty -= @lot.received_qty if @lot.received_qty
        @item.in_inspection_qty += @lot.received_qty
        @item.save

        @quantity = @po.quantities.where(item_id: @lot.item_id).first
        @quantity.amount_received += @lot.received_qty
        # @quantity.amount_remaining -= @lot.received_qty
        @quantity.amount_remaining -= @quantity.amount_received
        @quantity.save
## TODO: FIX AMOUNT REMAINING...SOMEHOW IT WENT TO -100
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
    @status_list = [['Inspection', 1], ['NCMR', 2], ['Inventory', 3], ['Exhausted', 4]]

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
          @lot.inventory_qty -= params["lot"]["build_lots_attributes"][(params["lot"]["build_lots_attributes"].length - 1).to_s]["pull_quantity"].to_i
          ## if lot is exhausted, change status to exhausted
          if @lot.inventory_qty == 0
            @lot.status = "Exhausted"
          end
          # @lot.save
          @item = Item.find(@lot.item_id)
          @item.stock_qty -= params["lot"]["build_lots_attributes"][(params["lot"]["build_lots_attributes"].length - 1).to_s]["pull_quantity"].to_i
          @item.save

          buildLotX = @lot.build_lots.last
          buildLotX.employee_id = params["lot"]["build_lots_attributes"][(params["lot"]["build_lots_attributes"].length - 1).to_s]["employee_id"].to_i
          buildLotX.pull_date = Date.today
          buildLotX.save
        end

        # calculate rejected qty as received qty - accepted qty
        if @lot.accepted_qty > 0
          @lot.rejected_qty = @lot.received_qty - @lot.accepted_qty
        end

        # save lot after updating all relevant fields
        @lot.save

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
                                  :build_lots_attributes => [:pull_quantity, :id, :my_build_id, :lot_id, :employee_id, :_destroy],
                                  :build_lot_ids => [])
    end
end
