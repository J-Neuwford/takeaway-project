class Receipt
  def initialize(order)
    @order = order.ordered
    @total = order.total
  end

  def summary
    # returns a list of ordered items and total cost as a string
    item_summary = ""
    @order.each { |item| 
      item_summary << "#{item.name}: #{item.price}, "
    }
    item_summary << "Total: #{@total}"
    return item_summary
  end
end