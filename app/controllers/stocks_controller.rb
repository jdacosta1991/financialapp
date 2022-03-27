   #--CONTROLADOR CREADO MANUAL PARA LA RUTA STOCK
class StocksController < ApplicationController
   #--ACCION PARA EL CONTROLADOR
  def search
   #--CONDICIONAL PARA BUSQUEDAS INVALIDAS
    if params[:stock].present? 
		  @stock = Stock.new_lookup(params[:stock])
      #--LINEA PARA QUE JAVASCRIPT MANEJE EL RESULTADO Y LAS ALERTAS
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          #--LOS MENSAJES FLASH.NOW PARA QUE NO TENGAN PERSISTENCIA EN LA PAG
          flash.now[:alert] = "Please enter a symbol valid to search"
          format.js { render partial: 'users/result' }
        end
      end
    else 
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/result' }
      end
    end
  end

end