class UserStocksController < ApplicationController
  #---- ACCION PARA CREAR STOCK EN FRONTEND VIEW
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "The Stock #{stock.ticker}, #{stock.name} is add to your portfolio"
    redirect_to my_portfolio_path
  end
  #----accion para eliminar stocks de usuarios
  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id,
                                  stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.name} is successfully removed"
    redirect_to my_portfolio_path
  end
  
  
end
