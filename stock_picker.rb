stockas = 10.times.map{Random.rand(20)}
puts stockas    
#stocks = [17,3,6,9,15,8,6,1,10]


def stock_picker stocks
    buy_date = 0
    sell_date = 0
    max_profit = 0
    
    stocks[0...-1].each_with_index do |buy,day | 
        stocks[(day+1)..-1].each do |sell|
            
            if sell - buy > max_profit
                max_profit = sell - buy
                buy_date = stocks.index(buy)
                sell_date = stocks.index(sell)
            end
            
        end
    end
    [buy_date, sell_date]
    
end

puts stock_picker(stockas)