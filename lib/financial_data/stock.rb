class FinancialData::Stock
    attr_accessor :ticker, :ceo, :price, :volume, :open, :close
    
    def self.today
        # puts <<-DOC.gsub /^\s*/, ""
        #     1.TSLA
        #     2.MELI
        # DOC
        stock_1 = self.new
        stock_1.ticker = "$TSLA"
        stock_1.ceo = "Elon Musk"
        stock_1.price = "$414"
        stock_1.volume = "1,000,000"
        stock_1.open = "$500"
        stock_1.close = "$400"

        stock_2 = self.new
        stock_2.ticker = "$MELI"
        stock_2.ceo = "Eduardo"
        stock_2.price = "$1000"
        stock_2.volume = "500,000"
        stock_2.open = "$1100"
        stock_2.close = "$1020"

        [stock_1, stock_2]
    end
end