class FinancialData::Stock
    attr_accessor :name, :ticker, :price, :delta, :volume, :open, :close
    
    def self.today
        self.add_to_watchlist
    end

    def self.add_to_watchlist
        stocks = []

        stocks << self.scrape_screener

        stocks

        # stock_1 = self.new
        # stock_1.name = "Tesla"
        # stock_1.ticker = "$TSLA"
        # stock_1.price = "$414"
        # stock_1.volume = "1,000,000"
        # stock_1.open = "$500"
        # stock_1.close = "$400"

        # stock_2 = self.new
        # stock_2.name = "Mercado Libre"
        # stock_2.ticker = "$MELI"
        # stock_2.price = "$1000"
        # stock_2.volume = "500,000"
        # stock_2.open = "$1100"
        # stock_2.close = "$1020"

        # [stock_1, stock_2]
    end

    def self.scrape_screener(stock)
        # doc = Nokogiri::HTML(open("link"))

        #stock = self.new
        # stock.name = doc.search("css").text
        # stock.ticker = #...
        #etc... 

        # get("/query?function=TIME_SERIES_DAILY&symbol=#{stock}&apikey=5PW8XBTTAD8P5SWLf")
        # binding.pry

        #stock

    end
end