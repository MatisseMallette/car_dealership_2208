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
end