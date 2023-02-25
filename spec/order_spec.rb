require 'order'

describe Order do
  before do
    @food_1 = double :food_1, name: "food_1", price: "£5.00"
    @food_2 = double :food_2, name: "food_2", price: "£7.50"
    @food_3 = double :food_3, name: "food_3", price: "£11.00"
    @menu = double :menu, list: [@food_1, @food_2, @food_3]
  end

    it 'returns the dish ordered from the menu' do
      order = Order.new(@menu)
      order.choose(@food_1)
      expect(order.ordered).to eq [@food_1]
    end
end