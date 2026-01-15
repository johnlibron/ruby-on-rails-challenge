class Api::V1::UsersController < Api::V1::BaseController
  def index
    @users = User
      .left_joins(:products)
      .select(
        'users.id',
        'users.name',
        'users.email',
        'users.age',
        'users.city',
        'COUNT(products.id) AS products_count'
      )
      .group('users.id')

    render json: @users.map do |user|
      {
        id: user.id,
        name: user.name,
        email: user.email,
        age: user.age,
        city: user.city,
        products_count: user.products_count.to_i
      }
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: {
      id: user.id,
      name: user.name,
      email: user.email,
      age: user.age,
      city: user.city
    }
  end
  
  def products
    @user = User.find(params[:id])
    render json: @user.products
  end
end