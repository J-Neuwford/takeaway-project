require 'order'

describe Order do
    it 'calls order on an empty order' do
      food = double :food
      menu = double :menu, list: food
      order = Order.new(menu)
      expect{ order.ordered }.to raise_error "This order is empty!"
    end

    it 'calls orderes on an empty order' do
      food = double :food
      menu = double :menu, list: food
      order = Order.new(menu)
      expect{ order.ordered }.to raise_error "This order is empty!"
    end

    before do
      @food_1 = double :food_1, name: "food_1", price: "£5.75"
      @food_2 = double :food_2, name: "food_2", price: "£7.50"
      @food_3 = double :food_3, name: "food_3", price: "£11.00"
      @menu = double :menu, list: [@food_1, @food_2, @food_3]
      @order = Order.new(@menu)
    end

    it 'returns the dish ordered from the menu' do
      @order.choose(@food_1)
      expect(@order.ordered).to eq [@food_1]
    end

    it 'returns all dishes ordered from the menu' do
      @order.choose(@food_1)
      @order.choose(@food_2)
      @order.choose(@food_3)
      expect(@order.ordered).to eq [@food_1, @food_2, @food_3]
    end

    it 'returns all dishes ordered from the menu, including deplicates' do
      @order.choose(@food_1)
      @order.choose(@food_2)
      @order.choose(@food_2)
      expect(@order.ordered).to eq [@food_1, @food_2, @food_2]
    end

    it 'returns the total value of ordered dishes' do
      @order.choose(@food_1)
      @order.choose(@food_2)
      expect(@order.total).to eq "£13.25"
    end
end