# Our CLI Controller
class FinancialData::CLI

    @@stocks = []
    
    def call
        print_watchlist
        list_stocks
        menu
    end

    def list_stocks
        puts "Hello! Please enter the ticker you want info on:"
        ticker = gets.strip
        puts "Please enter the date you wish to get #{ticker}'s info on YYYY-MM-DD format:"
        date = gets.strip
        equity = FinancialData::API.get_stock(ticker, date)
        puts "On #{date}, #{ticker} closed at #{equity.close} (#{equity.percent_change})."
        add_to_watchlist(ticker)
        puts "Would you like to see where the markets closed on this day? (Y/N)"
        indeces_close = gets.strip
        if indeces_close == "Y" || indeces_close == "y"
            puts "These were indices as of close on the day you picked:"
            indices = FinancialData::Stock.indices(date)
            puts <<-DOC
            S&P 500: #{indices[0].percent_change} 
            DJIA: #{indices[1].percent_change} 
            NASDAQ: #{indices[2].percent_change} 
            DOC
        end
    end

    def menu
        input = nil
        if @@stocks.length != 0
            @@stocks.each_with_index{|stock, index| puts "#{index + 1} - #{stock}"}
        end
        while input != 'exit'
            puts "Enter the number of stock you'd like more info on, type list to get stocks again, or type exit to quit:"
            input = gets.strip.downcase
            if input.to_i > 0
                the_stock = @@stocks[input.to_i - 1] 
                #puts "#{the_stock.symbol} closed at #{the_stock.close} (#{the_stock.percent_change})."
            elsif input == 'list'
                list_stocks
            elsif input == "exit"
                goodbye
            else
                puts "Invalid option"
            end
        end
    end

    def print_watchlist
        if @@stocks.length == 0
            puts "Your watchlist is empty."
        else
            puts "Here's your watchlist: #{@@stocks}"
        end
    end

    def add_to_watchlist(ticker)
        puts "Would you like to add this stock to your watchlist? (Y/N)"
        watchlist_add = gets.strip
        if watchlist_add == "Y" || watchlist_add == "y"
            @@stocks << ticker
            puts "#{ticker} was added to your watchlist."
        else
            puts "#{ticker} was not added to your watchlist."
        end
    end

    def goodbye
        puts "See you later!"
    end

end