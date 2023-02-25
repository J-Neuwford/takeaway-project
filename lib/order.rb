class Order # is initialized with a menu object
  def initialize(menu)
    @menu = menu
    @ordered = []
  end

  def choose(dish)
    @ordered << dish if @menu.list.include?(dish)
  end

  def ordered
    return @ordered
  end

  def total
    # returns a string containing the total cost of the order
  end
end