class ProductsController < ApplicationController
    def index 
        @products = Product.all 
    end 

    def show 
        @product = Product.find(params[:id])
        # render :show
    end
      
    def new 
        @product = Product.new
        @errors = flash[:errors]
      #   render :new 
    end 
      
    def create 
        @product = Product.create(product_params)
      
        if @product.valid?
          redirect_to products_path(@products)
        else
          flash[:errors] = @product.errors.full_messages
          redirect_to products_path(@products)
        end 
        
    end
    def edit 
        @product = Product.find(params[:id])
        # render :edit
    end 
    def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          redirect_to product_path(@product.id)
        else
          flash[:errors] = @post.errors.full_messages
          redirect_to edit_post_path(@post)
        end  
    
    end 

    def destroy 
        @product = Product.find(params[:id])
        @product.destroy 
        redirect_to products_path(@products)
    end 

    



    private
        def product_params 
            params.require(:product).permit(:name, :image, :price)
        end 
end
