class StaticPagesController < ApplicationController
  def home
    if current_user.nil?
    else
    @user = User.find(current_user.id)
    @orders = Order.all
    @orderitems = Orderitem.all
    end
  end

  def help
  end

  def about
  end

  def categories
    @categories = Category.all
  end

   
   def category
     catName = params[:title]
     @items = Item.where("country  like ? ", catName)
   end

   def purchase
      @user = User.find(current_user.id)

      
      
      @items = @user.orders.orderitems

      
      
      end
      
end
