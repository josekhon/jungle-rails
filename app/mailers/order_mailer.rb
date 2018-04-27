class OrderMailer < ApplicationMailer
    def order_receipt(order)
        @order = order    
        mail(to: @order.email, subject:"Jungle confirmation:  Order \n##{@order.id}")
      end
end
