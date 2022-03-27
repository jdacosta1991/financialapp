   #--CONTROLADOR CREADO MANUAL PARA LA RUTA STOCK
class StocksController < ApplicationController
   #--ACCION PARA EL CONTROLADOR
  def search
   #--CONDICIONAL PARA BUSQUEDAS INVALIDAS
    if params[:stock].present? 
		  @stock = Stock.new_lookup(params[:stock])
       if @stock
         render 'users/my_portfolio'
       else
         flash[:alert] = "Please enter a symbol valid to search"
         redirect_to my_portfolio_path
        end
    else 
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

end