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
    @url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD,EUR'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @prices_crypto = JSON.parse(@response)

  end

  def prices 

    
  end
end
