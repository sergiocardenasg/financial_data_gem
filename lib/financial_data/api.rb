require "httparty"
require "date"

class FinancialData::API
    def self.get_stock(ticker, dte)

        response = HTTParty.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{ticker}&outputsize=full&apikey=204434fef8msh8e46af857668808p1a4a3djsne5de0d5a94fc")

        if response["Error Message"]
            return false
        end

        d = Date.parse(dte) 

        if d.saturday?
            d = d - 1
        elsif d.sunday?
            d = d - 2
        elsif d.monday?
            d = d - 3
        else
            d
        end

        symbol = response["Meta Data"]["2. Symbol"]
        date = response["Time Series (Daily)"][d.to_s]
        opn = date["1. open"].to_f
        high = date["2. high"].to_f
        volume = date["5. volume"].to_i
        close = date["4. close"].to_f
        yesterday_close = response["Time Series (Daily)"][d.prev_day.to_s]["4. close"].to_f
        volume = date["5. volume"].to_i
        percent_change = (((close - yesterday_close)/yesterday_close.to_f)*100).round(2).to_s + "%"
        
        attributes = {:symbol => symbol, :d => d,:date => date, :opn => opn, :high => high, :close => close, :volume => volume, :percent_change => percent_change} 
        
        stock = FinancialData::Stock.new
        stock.attrs_from_hash(attributes)
        stock
    end
end