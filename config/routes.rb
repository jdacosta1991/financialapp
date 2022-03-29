Rails.application.routes.draw do
  
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root 'welcome#index'
#---- RUTA PARA MY_PORTFOLIO CONTROLADOR USERS Y ACCION MY_PORTOFOLIO
  get 'my_portfolio', to: 'users#my_portfolio'
#---- RUTA PARA MOSTRAR EL VALOR DE STOCK UNA VEZ QUE SE HAGA LA BUSQUEDAD
  get 'search_stock', to: 'stocks#search'
#---- Ruta para amigos
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
end
