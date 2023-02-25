class Menu
  def initialize
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def list
    raise "There are no dishes on this menu!" if @menu == []
    return @menu
  end

  def show_menu
    raise "There are no dishes on this menu!" if @menu == []
    list = []
    @menu.each { |item|
      list << "#{item.name}: #{item.price}"
    }
    return list
  end
end