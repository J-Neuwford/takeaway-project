require 'menu'

describe Menu do
  context 'calls the show_menu method' do
    it 'on a menu with three dishes' do
      menu = Menu.new
      food_1 = double :food_1, name: "food_1", price: "£5.00"
      food_2 = double :food_2, name: "food_2", price: "£7.50"
      food_3 = double :food_3, name: "food_3", price: "£11.00"
      menu.add(food_1)
      menu.add(food_2)
      menu.add(food_3)
      expect(menu.show_menu).to eq ["food_1: £5.00","food_2: £7.50","food_3: £11.00"]
    end 

    it 'on an empty menu' do
      menu = Menu.new
      expect { menu.list }.to raise_error "There are no dishes on this menu!"
    end
  end 

  it 'calls the list method' do
    menu = Menu.new
    food_1 = double :food_1, name: "food_1", price: "£5.00"
    food_2 = double :food_2, name: "food_2", price: "£7.50"
    food_3 = double :food_3, name: "food_3", price: "£11.00"
    menu.add(food_1)
    menu.add(food_2)
    menu.add(food_3)
    expect(menu.list).to eq [food_1, food_2, food_3]
  end 

  it 'on an empty menu' do
    menu = Menu.new
    expect { menu.show_menu }.to raise_error "There are no dishes on this menu!"
  end
end