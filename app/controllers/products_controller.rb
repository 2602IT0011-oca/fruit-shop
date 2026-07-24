class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

    # 商品一覧画面
  def index
    @products = Product.all
  end

   # 商品詳細
  def show
    @product = Product.find(params[:id])
  end

    # 商品編集
  def edit
    @product = Product.find(params[:id])
  end

  # 商品更新
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # 商品詳細にリダイレクト
      redirect_to product_path 
    else
      # 失敗時に編集画面に戻る
      render :edit  
    end
  end

    # 商品削除
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # 商品一覧にリダイレクト
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
