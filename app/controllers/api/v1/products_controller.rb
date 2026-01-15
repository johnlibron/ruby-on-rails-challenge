class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product.all.includes(:user)
    expensive_product_ids = @products.expensive.pluck(:id)

    result = @products.map do |product|
      {
        id: product.id,
        name: product.name,
        description: product.description,
        price: product.price,
        user: {
          id: product.user.id,
          name: product.user.name,
          email: product.user.email
        },
        is_expensive: expensive_product_ids.include?(product.id)
      }
    end
    
    render json: result
  end
end