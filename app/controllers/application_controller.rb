class ApplicationController < ActionController::Base
#------ANTES DE CUALQUIER ACCION AUNTENTICA USUARIO----- 	
	before_action :authenticate_user!
#------ ADD ADITIONAL FIELDS PARA EDITAR USUARIO  
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
	end
	

	
	
end
