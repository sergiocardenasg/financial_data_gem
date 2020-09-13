class FinancialData::Stock
    attr_accessor :d, :symbol, :date, :opn, :high, :low, :close, :yesterday_close, :volume, :percent_change

    def attrs_from_hash(attrs)
        attrs.each do |k, v|
            send("#{k}=", v)
        end
    end

    def self.indices(date)
        indices = ["SPY", "DIA", "QQQ"]
        indices.collect{|index|FinancialData::API.get_stock(index, date)}
    end
end