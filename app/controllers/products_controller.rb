class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :json, :html

  caches_page :public

  caches_action :index, if: Proc.new do
    !request.format.json?  # cache if is not a JSON request
  end

  caches_action :show, cache_path: { project: 1 },
    expires_in: 1.hour

  caches_action :feed, cache_path: Proc.new do
    if params[:user_id]
      user_list_url(params[:user_id], params[:id])
    else
      list_url(params[:id])
    end
  end
end


Rails.cache.write("navbar-user-#{current_user.id}", object)

Rails.cache.read("navbar-user-#{current_user.id}")


  # GET /products
  # GET /products.json
  def index
    if params[:q]
      search_term = params[:q]
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end
    respond_with @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end 

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour)
    end
end
