class UserStocksController < ApplicationController
  #---- ACCION PARA CREAR STOCK EN FRONTEND VIEW
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "The Stock #{stock.ticker} #{stock.name} is add to your portfolio"
    redirect_to my_portfolio_path
  end
  
end
