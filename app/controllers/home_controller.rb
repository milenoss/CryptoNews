class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    #grab news data
    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)

    
    #grab price data
    @prices_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,XRP,ETH,BCH,EOS,LTC,ADA,XLM,MIOTA,USDT,TRX&tsyms=USD,EUR'
    @prices_uri = URI(@prices_url)
    @prices_response = Net::HTTP.get(@prices_uri)
    @prices_crypto = JSON.parse(@prices_response)

    
  end

  
  def prices 
    require 'net/http'
    require 'json'
    @symbol = params[:sym]
    if @symbol
    @symbol = @symbol.upcase

    #grab price data
    @quote_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=' + @symbol +  '&tsyms=USD,EUR'
    @quote_uri = URI(@quote_url)
    @quote_response = Net::HTTP.get(@quote_uri)
    @quote = JSON.parse(@quote_response)

    end
  end
end
