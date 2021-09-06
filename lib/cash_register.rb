
require 'pry'
class CashRegister

    attr_reader 
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
             self.items << title
        end
       self.last_transaction = price * quantity #last_transaction will always == the price * quantity of the item(s) added last
    end             #last_transaction will update every time new items are added

    def apply_discount
        self.total -= @total * @discount / 100
        if @discount == 0
            "There is no discount to apply."
        else 
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction #therefore, total = total - last_transaction - in other words...
    end                                 #total = total - the quanity * amount of the last item(s) added with the .new_item method
    

end
