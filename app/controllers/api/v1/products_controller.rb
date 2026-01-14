class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product.all.includes(:user)
    
    expensive_product_ids = []
    @products.each do |product|
      if product.price > 100
        expensive_product_ids << product.id unless expensive_product_ids.include?(product.id)
      end
    end
    
    result = @products.map do |product|
      user_info = User.find(product.user_id)
      {
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        user: {
          id: user_info.id,
          name: user_info.name,
          email: user_info.email
        },
        is_expensive: expensive_product_ids.include?(product.id)
      }
    end
    
    render json: result
  end
end