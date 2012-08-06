class Admin::ProductsController < ApplicationController
  layout 'admin'
  load_and_authorize_resource

  def index
    @products = Product.limit(6).order("created_at DESC")
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
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end


  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to admin_products_path, notice: "Product destroyed successfully."
    end
  end

end
