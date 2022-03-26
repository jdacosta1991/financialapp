class ApplicationController < ActionController::Base
#------ANTES DE CUALQUIER ACCION AUNTENTICA USUARIO----- 	
	before_action :authenticate_user!
end
