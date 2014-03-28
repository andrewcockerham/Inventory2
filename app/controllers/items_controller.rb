class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]


###### my custom methods
  
  # show all purchase orders of an item
  def get_purchase_orders
    @item = Item.find(params[:id])
    @purchase_orders = @item.purchase_orders
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.parts.build #### DONT FORGET THIS!!! BLOG/TUTORIAL ABOUT IT!!!
  end

  # GET /items/1/edit
  def edit
    # # Item.create_name_and_number
    # @item.name_and_number = @item.part_number + " " + @item.name
    # # Item.create_name_and_rev
    # @item.number_and_rev = @item.part_number + " Rev " + @item.revision
    # # Item.create_number_rev_name
    # @item.number_rev_name = @item.number_and_rev + " " + @item.name
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # Item.create_name_and_number
    @item.name_and_number = @item.part_number + " " + @item.name
    # Item.create_name_and_rev
    @item.number_and_rev = @item.part_number + " Rev " + @item.revision
    # Item.create_number_rev_name
    @item.number_rev_name = @item.number_and_rev + " " + @item.name
    @item.on_order_qty = 0
    @item.in_inspection_qty = 0
    @item.stock_qty = 0
    @item.ncmr_qty = 0
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    ### pull info from params hash to fix bug!!!
    # Item.create_name_and_number
    @item.name_and_number = item_params[:part_number] + " " + item_params[:name]
    # @item.name_and_number = @item.part_number + " " + @item.name
    # Item.create_name_and_rev
    @item.number_and_rev = item_params[:part_number] + " Rev " + item_params[:revision]
    # Item.create_number_rev_name
    @item.number_rev_name = @item.number_and_rev + " " + item_params[:name]
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:part_number, :name, :on_order_qty, :revision, :current_rev,
                                   :in_inspection_qty, :stock_qty, :ncmr_qty,
                                   :name_and_number, :parts_attributes => [:id, :supplier_id, :_destroy])
    end
end
