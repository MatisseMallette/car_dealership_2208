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
end