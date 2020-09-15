# Our CLI Controller
class FinancialData::CLI

    @@stocks = []
    
    def call
        list_stocks
        menu
    end

    def list_stocks
        while true
            puts "Hello! Please enter the ticker you want info on:"
            ticker = gets.strip
            if ticker =~ /\d/
                puts "Please enter valid ticker symbol."
            else
                break
            end
        end           
        while true
            puts "Please enter the date you wish to get #{ticker}'s info on YYYY-MM-DD format:"
            date = gets.strip
            is_future = Date.parse(date) 
            if is_future > Date.today
                puts "You selected a date in the future. Please re-enter the ticker and select a valid date."
            else
                break
            end
        end
        equity = FinancialData::API.get_stock(ticker, date)
        puts "On #{date}, #{ticker} closed at #{equity.close} (#{equity.percent_change})."
        add_to_watchlist(equity) unless @@stocks.include?(equity.symbol)
        market_close(date)
    end

    def market_close(date)
        puts "Would you like to see where the markets closed on this day? (Y/N)"
        indeces_close = gets.strip
        if indeces_close == "Y" || indeces_close == "y"
            puts "These were indices as of #{date}:"
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
        while input != 'exit'
            puts "Type 'watchlist' to see you watchlist, type 'new stock' to get another stock's info, or type exit to quit:"
            input = gets.strip.downcase
            if input == 'watchlist' && @@stocks.length != 0
                print_watchlist
                puts "Enter the number of the stock in your watchlist you'd like more info on:"
                get_info = gets.strip
                if get_info.to_i > 0
                    the_stock = @@stocks[get_info.to_i-1]
                    puts "On this day, #{the_stock.symbol} opened at $#{the_stock.opn}, had an intraday high of $#{the_stock.high}, and closed at $#{the_stock.close} (#{the_stock.percent_change})."
                    puts "Would you like to remove this stock from your watchlist? (Y/N)"
                    rmv = gets.strip
                    if rmv == "Y" || rmv == "y"
                        delete_from_watchlist(the_stock)
                        puts "#{the_stock.symbol} has been removed from your watchlist."
                    end
                end
            elsif input == 'new stock'
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
            puts "Here's your watchlist:"
            @@stocks.each_with_index{|stock, index| puts "#{index + 1} - #{stock.symbol}"}
        end
    end

    def add_to_watchlist(equity)
        puts "Would you like to add this stock to your watchlist? (Y/N)"
        watchlist_add = gets.strip
        if watchlist_add == "Y" || watchlist_add == "y"
            if @@stocks.detect{|stock|(stock.symbol)}
                puts "#{equity.symbol} is already in your watchlist."
            else
                @@stocks << equity
                puts "#{equity.symbol} was added to your watchlist."
            end
        else
            puts "#{equity.symbol} was not added to your watchlist."
        end
    end

    def delete_from_watchlist(equity)
        @@stocks.delete(equity)
    end

    def goodbye
        puts "See you later!"
    end

end