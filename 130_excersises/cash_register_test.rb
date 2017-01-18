require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test 
  def setup
    @new_register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end
  
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20 
    
    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    
    assert_equal previous_amount + 20, current_amount
  end
  
  def test_change 
    @transaction.amount_paid = 25
    assert_equal 15, @new_register.change(@transaction)
  end
  
  def test_give_receipt
    assert_output("You've paid $10.\n") do
      @new_register.give_receipt(@transaction)
    end
  end
  
  def test_prompt_for_payment
    @transaction.prompt_for_payment(10)
    assert_equal 10, @transaction.amount_paid
  end
  
end