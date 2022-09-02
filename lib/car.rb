class Car
  attr_reader :make, :model, :monthly_payment, :loan_length, :total_cost, :make_and_model
  def initialize(make_and_model, monthly_payment, loan_length)
    @make_and_model = make_and_model
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @make = make_and_model.split(" ")[0]
    @model = make_and_model.split(" ")[1]
    @total_cost = monthly_payment * loan_length
  end
end