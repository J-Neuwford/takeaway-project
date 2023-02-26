require 'receipt'

describe Receipt do
  it 'returns an itemised order with the total cost' do
    food_1 = double :food_1, name: "food_1", price: "£5.75"
    food_2 = double :food_2, name: "food_2", price: "£7.50"
    food_3 = double :food_3, name: "food_3", price: "£11.00"
    menu = double :menu, list: [food_1, food_2, food_3]
    order = double :order, ordered: [food_1, food_2, food_3], total: "£24.25"
    receipt = Receipt.new(order)
    expect(receipt.summary).to eq  "food_1: £5.75, food_2: £7.50, food_3: £11.00, Total: £24.25"
  end
end
