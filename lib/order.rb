class Order # is initialized with a menu object
  def initialize(menu)
    @menu = menu
    @ordered = []
  end

  def choose(dish)
    @ordered << dish if @menu.list.include?(dish)
  end

  def ordered
    raise "This order is empty!" if @ordered == []
    return @ordered
  end

  def total
    pounds = 0
    pence = 0
    @ordered.each { |item| 
      item = item.price.delete("£").split(".")
      pounds += item[0].to_i
      pence += item[1].to_i
      pounds = pounds += pence/100.floor
      pence = pence % 100
    }
    return "£#{pounds}.#{pence}"
  end
end