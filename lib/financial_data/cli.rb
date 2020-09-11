# Our CLI Controller
class FinancialData::CLI

    @@all = []
    
    def call
        list_stocks
        menu
    end

    def list_stocks
        puts "Hello! Please enter the ticker you want info on:"
        ticker = gets.strip
        #indices = FinancialData::Stock.indices
        puts "Please enter the date you wish to get #{ticker}'s info on YYYY-MM-DD format:"
        date = gets.strip
        equity = FinancialData::API.get_stock(ticker, date)
        puts "On #{date}, #{ticker} closed at #{equity.close} (#{equity.percent_change})."
        puts "These were indices as of close on the day you picked:"
        indices = FinancialData::Stock.indices(date)
        puts <<-DOC
        S&P 500: #{indices[0].percent_change} 
        DJIA: #{indices[1].percent_change} 
        NASDAQ: #{indices[2].percent_change} 
        DOC
    end

    def menu
        input = nil
        while input != 'exit'
            puts "Enter the number of stock you'd like more info on, type list to get stocks again, or type exit to quit:"
            input = gets.strip.downcase
            if input.to_i > 0
                the_stock = @stocks[input.to_i - 1]
                puts "#{i}. #{stock.ticker} - #{stock.price}"
            elsif input == 'list'
                list_stocks
            elsif input == "exit"
                goodbye
            else
                puts "Invalid option"
            end
        end
    end

    def add_to_watchlist
        @@all << self
    end

    def goodbye
        puts "See you later!"
    end

end