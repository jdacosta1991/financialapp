class UsersController < ApplicationController
  #--ACCION PARA MOSTRAR RESULTADOS EN TABLA
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
end
