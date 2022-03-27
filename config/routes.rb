Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'
#----RUTA PARA MY_PORTFOLIO CONTROLADOR USERS Y ACCION MY_PORTOFOLIO
  get 'my_portfolio', to: 'users#my_portfolio'
#---- RUTA PARA MOSTRAR EL VALOR DE STOCK UNA VEZ QUE SE HAGA LA BUSQUEDAD
  get 'search_stock', to: 'stocks#search'
end
