require "httparty"

class FinancialData::API
    def self.get_stock(ticker)

        response = HTTParty.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{ticker}&apikey=204434fef8msh8e46af857668808p1a4a3djsne5de0d5a94fc")

        JSON.parse(response.body)

        # ticker.symbol = response["Meta Data"]["2. Symbol"]
        # ticker.date = response["Time Series (Daily)"]["#date"]
        # ticker.open = response["Time Series (Daily)"]["#date"]["1. open"].to_f
        # ticker.high = response["Time Series (Daily)"]["#date"]["2. high"].to_f
        # ticker.low = response["Time Series (Daily)"]["#date"]["3. low"].to_f
        # ticker.close = response["Time Series (Daily)"]["#date"]["4. close"].to_f
        # ticker.volume = response["Time Series (Daily)"]["#date"]["5. volume"].to_i

        #ticker.percentage_change = (((ticker.close(today) - ticker.open(yesterday))/ticker.open(yesterday).to_f)*100).round(2).to_s + "%"

        # url = URI("https://alpha-vantage.p.rapidapi.com/query?outputsize=compact&datatype=json&function=TIME_SERIES_DAILY&symbol=#{symbol}")

        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        # request = Net::HTTP::Get.new(url)
        # request["x-rapidapi-host"] = 'alpha-vantage.p.rapidapi.com'
        # request["x-rapidapi-key"] = '204434fef8msh8e46af857668808p1a4a3djsne5de0d5a94fc'

        # response = http.request(request)
        # return response.read_body
    end
end