# Our CLI Controller
class FinancialData::CLI

    def call
        list_stocks
        menu
    end

    def list_stocks
        puts "What stock do you wanna add to your watchlist?"
        @stocks = FinancialData::Stock.today
        @stocks.each.with_index(1) do |stock, i|
            puts "#{i}. #{stock.name} (#{stock.ticker}) - #{stock.price}"
        end
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

    def goodbye
        puts "See you later!"
    end

end