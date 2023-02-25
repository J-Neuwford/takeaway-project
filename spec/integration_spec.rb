require 'dish'
require 'menu'
require 'order'
require 'receipt'

describe 'integration' do
  xit 'orders two dishes from a menu containing three dishes' do
    menu = Menu.new
    dish_1 = Dish.new("dish_1", "£5.00")
    dish_2 = Dish.new("dish_2", "£7.50")
    dish_3 = Dish.new("dish_3", "£11.00")
    menu.add(dish_1)
    menu.add(dish_2)
    menu.add(dish_3)
    order = Order.new(menu)
    order.choose(dish_1)
    order.choose(dish_3)
    receipt = Receipt.new(order)
    result = receipt.summary
    expect(result).to eq '["dish_1: £5.00", "dish_2: £7.50" "dish_3: £11.00"] "Total: £16.00"'
  end
end