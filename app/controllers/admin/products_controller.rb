class Admin::ProductsController < ApplicationController
  layout 'admin'
  load_and_authorize_resource

  def index
    # 1. extract 'order' to scope
    # 2. is 'order' needed anyway? by default it's sorting by id
    @products = Product.paginate(page: params[:page]).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path, notice: "Product created!"
    else
      render :new
    end
  end

  def show
    # 4 equal lines in 4 methods can be extracted to 1 private method call 
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id]) 
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_path(@product),
          notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
        # either provide json for every method or don't do it
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    product = Product.find(params[:id])
    # product destroy usually always successfull, don't need to check it
    if product.destroy
      redirect_to admin_products_path, notice: "Product destroyed successfully."
    end
  end

end
