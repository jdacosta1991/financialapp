class Stock < ApplicationRecord
#----DEFINIMOS EL METODO PARA OBTENER EL TICKER DESDE LA API
    def self.new_lookup(ticker_symbol)
#----CODIGO PROPORCIONADO DESDE LA DOC DE LA API
			client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:cloud_api_key],
                              endpoint: 'https://cloud.iexapis.com/v1')
			client.quote(ticker_symbol).latest_price
    end
end
