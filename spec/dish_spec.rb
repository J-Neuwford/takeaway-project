require 'dish'

RSpec.describe Dish do
  context 'is instantiated and' do
    it 'returns the dish name' do
      dish = Dish.new("food", "£5.00")
      expect(dish.name).to eq "food"
    end 

    it 'returns the dish price' do
      dish = Dish.new("food", "£5.00")
      expect(dish.price).to eq "£5.00"
    end 
  end
end