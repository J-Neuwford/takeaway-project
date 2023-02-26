# {TAKEAWAY} - GOLDEN SQAURE PHASE 4

# --USER STORIES-----------------

>As a customer
>So that I can check if I want to order something
>I would like to see a list of dishes with prices.

>As a customer
>So that I can order the meal I want
>I would like to be able to select some number of several available dishes.

>As a customer
>So that I can verify that my order is correct
>I would like to see an itemised receipt with a grand total.

# (after API mocking bite)
# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.
>As a customer
>So that I am reassured that my order will be delivered on time
>I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.


# --DESIGN----------------------

                            ┌────────────┐
                            │  TAKEAWAY  │
                            └────────────┘

┌─────────────────────────────┐        ┌─────────────────────────────┐
│                             │        │                             │
│ MENU                        │        │ DISH(name, price)           │
│                             │        │                             │
│ -add(Dish)                  │        │ -name                       │
│                             │        │                             │
│ -list                       ├────────┤ -price                      │
│                             │        │                             │
│ -show_menu                  │        │                             │
│                             │        │                             │
│                             │        │                             │
│                             │        │                             │
└──────────────┬──────────────┘        └─────────────────────────────┘
               │
               │
               │
               │
┌──────────────┴──────────────┐        ┌─────────────────────────────┐
│                             │        │                             │
│ ORDER(Menu)                 │        │ RECEIPT(Order)              │
│                             │        │                             │
│ -order(Dish)                │        │ -receipt                    │
│                             │        │                             │
│ -ordered                    ├────────┤                             │
│                             │        │                             │
│ -total                      │        │                             │
│                             │        │                             │
│                             │        │                             │
│                             │        │                             │
└─────────────────────────────┘        └─────────────────────────────┘

```ruby

class Dish #initialized with name and price strings
  def initialize(name, price)
    #...
  end

  def name
    # returns Dish name as a string
  end

  def price
    # returns Dish price as a string
  end
end

class Menu
  def initialize
    #...
  end

  def add(dish)
    # pushes a Dish object to a list
  end

  def list
    # returns a list of Dishes
  end

  def show_menu
    # returns a list of dishes as strings
  end
end

class Order # is initialized with a menu object
  def initialize(menu)
    #...
  end

  def choose(dish)
    # pushes a Dish object from menu to a list 
  end

  def ordered
    # returns a list of strings containing selected dishes
  end

  def total
    # returns a string containing the total cost of the order
  end
end

class Receipt
  def initialize(order)
    #...
  end

  def summary
    # returns a list of ordered items and total cost as strings.
  end
end

```

# --TESTS----------------------

# Integration: 
``` ruby

#1
# orders two dishes from a menu containing three dishes
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
receipt.summary # => "dish_1: £5.00", "dish_2: £7.50" "dish_3: £11.00 Total: £16.00


```

# Dish Unit Tests
```ruby
#1
# instantiated with name
dish = Dish.new("food", "£5.00")
dish.name #=> "food"

#2
## instantiated with price
dish = Dish.new("food", "£5.00")
dish.price #=> "£5.00"
```

# Menu Unit Tests
```ruby
#1 
# add dish objects to the menu and return the menu as a list of strings
menu = Menu.new
menu.add(Dish.new("food_1", "£5.00"))
menu.add(Dish.new("food_2", "£7.50"))
menu.add(Dish.new("food_3", "£11.00"))
menu.list #=> ["food_1: £5.00","food_2: £7.50","food_3: £11.00"]

#2
# call list method on an empty menu
menu = Menu.new
menu.list #=> raise error "There are no dishes on this menu!"
```

# Order Unit Tests
```ruby
#1
# returns the dish ordered from the menu
order = Order.new(menu)
order.choose("food_1")
order.ordered # => ["food_1"]

#2
# returns all dishes ordered from the menu
order = Order.new(menu)
order.choose(food_1)
order.choose(food_2)
order.choose(food_3)
order.ordered # => [food_1, food_2, food_3]

#3
# returns all dishes ordered from the menu including duplicates
order = Order.new(menu)
order.choose(food_1)
order.choose(food_2)
order.choose(food_2)
order.ordered # => [food_1, food_2, food_3]

#4
# throws an error if ordered is called on an empty order
order = Order.new(menu)
order.ordered # => raise error "This order is empty!"

#5
# returns the total value of ordered dishes
order = Order.new(menu)
order.choose("food")
order.total # => "£5.00"
```
# Receipt Unit Tests
```ruby
#1
# returns a itemised receipt with total price
receipt = Receipt.new(order)
receipt.summary #=> "dish_1: £5.75, dish_3: £11.00, Total: £16.75"
```