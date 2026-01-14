class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User.all
    
    render json: @users.map do |user|
      {
        id: user.id,
        name: user.name,
        email: user.email,
        age: user.age,
        city: user.city,
        products_count: user.products.count # This will trigger N+1 queries
      }
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  
  def products
    @user = User.find(params[:id])
    @products = Product.where("user_id = ?", params[:id].to_s)
    
    render json: @products
  end
end