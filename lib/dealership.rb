class Dealership 
  attr_reader :inventory
  def initialize(name, address)
    @inventory = []
  end

  def inventory_count 
    return @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    if self.inventory_count == 0 
      return false
    else
      return true
    end
  end

  def average_price_of_car 
    total = 0
    @inventory.each do |car|
      total += (car.total_cost)
    end
    return total / self.inventory_count
  end

  def cars_by_make(make)
    selected_cars = []
    @inventory.each do |car|
      if car.make == make 
        selected_cars << car
      end
    end
    return selected_cars
  end
end