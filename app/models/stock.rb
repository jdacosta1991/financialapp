class Stock < ApplicationRecord
#----AGREGAMOS LOS MANY TO MANY
has_many :user_stocks
has_many :users, through: :user_stocks
#----AGREGAMOS UN VALIDATE
validates :name, :ticker, presence: true
#----DEFINIMOS EL METODO PARA OBTENER EL TICKER DESDE LA API
  def self.new_lookup(ticker_symbol)
#----CODIGO PROPORCIONADO DESDE LA DOC DE LA API
			client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:cloud_api_key],
                                    endpoint: 'https://cloud.iexapis.com/v1')
#----AGREGAMOS LOS 3 VALORES DE DB PARA SER MOSTRADOS EN EL DISPLAY
			begin
        new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,
                                 last_price: client.quote(ticker_symbol).latest_price)            
       rescue => exception
      
       return nil  
      
      end                            
  end
end
