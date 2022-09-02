require 'rspec'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do
    @dealership = Dealership.new 
  end

  it 'exists' do
    expect(@dealership).to be_an_instance_of(Dealership)
  end
end