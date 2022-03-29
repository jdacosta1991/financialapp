class UsersController < ApplicationController
  #--ACCION PARA MOSTRAR RESULTADOS EN TABLA
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
  def my_friends
    @friends = current_user.friends
  end
  def search
    #--CONDICIONAL PARA BUSQUEDAS INVALIDAS
     if params[:friend].present? 
       @friend = params[:friend]
       #--LINEA PARA QUE JAVASCRIPT MANEJE EL RESULTADO Y LAS ALERTAS
       if @friend
         respond_to do |format|
           format.js { render partial: 'users/friend_result' }
         end
       else
         respond_to do |format|
           #--LOS MENSAJES FLASH.NOW PARA QUE NO TENGAN PERSISTENCIA EN LA PAG
           flash.now[:alert] = "Couldn't find user"
           format.js { render partial: 'users/friend_result' }
         end
       end
     else 
       respond_to do |format|
         flash.now[:alert] = "Please enter a friend name or email to search"
         format.js { render partial: 'users/friend_result' }
       end
     end
   end
  
  
end
