# Our CLI Controller
class FinancialData::CLI

    def call
        list_stocks
        menu
        goodbye
    end

    def list_stocks
        puts "What stock are you looking for?"
        @stocks = FinancialData::Stock.today
    end

    def menu
        input = nil
        while input != 'exit'
            puts "Enter the number of stock you'd like more info on, type list to get stocks again, or type exit to quit:"
            input = gets.strip.downcase
            case input
            when "1"
                puts "More info on Tesla"
            when "2"
                puts "More info on Mercado Libre"
            when "list"
                list_stocks
            else
                puts "Invalid option"
            end
        end
    end

    def goodbye
        puts "See you later!"
    end

end