require_relative "./financial_data/version"
require_relative './financial_data/cli'
require_relative './financial_data/stock'
require_relative './financial_data/api'


require 'pry'
require 'nokogiri'
require 'httparty'
require 'openssl'

require 'uri'
require 'net/http'

module FinancialData
#   class Error < StandardError; end
#   # Your code goes here...

    # include HTTParty

    # def self.find(symbol)
    #     get("https://alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{symbol}&apikey=5PW8XBTTAD8P5SWLf.json")
    # end

    # def self.get_stock(symbol)
    #     url = URI("https://alpha-vantage.p.rapidapi.com/query?outputsize=compact&datatype=json&function=TIME_SERIES_DAILY&symbol=#{symbol}")

    #     http = Net::HTTP.new(url.host, url.port)
    #     http.use_ssl = true
    #     http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #     request = Net::HTTP::Get.new(url)
    #     request["x-rapidapi-host"] = 'alpha-vantage.p.rapidapi.com'
    #     request["x-rapidapi-key"] = '204434fef8msh8e46af857668808p1a4a3djsne5de0d5a94fc'

    #     response = http.request(request)
    #     puts response.read_body
    # end
end

