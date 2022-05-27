class Money
  include Comparable
  attr_reader :amount, :currency

  def initialize(amount, currency = "USD")
    @amount   = amount
    @currency = currency
  end
end
