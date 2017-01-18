require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start
MiniTest::Reporters.use!

require_relative 'to_do'

class TodoListTest < MiniTest::Test 
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]
    
    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
    @list.first.done!
    assert_equal(false, @list.done?)
    @list.each(&:done!)
    assert_equal(true, @list.done?)
  end
  
  def test_adding_not_todo
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hello') }
  end 
  
  def test_shovel 
    todo4 = Todo.new("Name")
    @list << todo4
    assert_same(todo4, @list.last)
  end
  
  def test_add_alias
    new_todo = Todo.new("Walk the dog")
    copy_list = @list.clone
    @list << new_todo
    copy_list.add(new_todo)
  
    assert_equal(copy_list.to_a, @list.to_a)
  end
  
  def test_item_at
    assert_raises(IndexError) { @list.item_at(5) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end
  
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!
    
    @list.mark_undone_at(1)
    
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  
  def test_done!
    @list.done! 
    
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end
  
  def test_remove_at
    # assert_raises(IndexError) {@list.remove_at(100) }
    
    @list.remove_at(0)
    
    assert_equal(2, @list.size)
    assert_equal(false, @list.to_a.include?(@todo1))
  end
  
  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    --- Today's Todos ---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_with_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    --- Today's Todos ---
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    
    @todo1.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_with_all_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    --- Today's Todos ---
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    @list.each { |item| item.done! }
    
    assert_equal(true, @list.done?)
  end
  
  def test_each_returns_self
    self_test = @list.each { |item| item }
    
    assert_equal(@list, self_test)
  end
  
  def test_select
    @todo1.done!
    selected = @list.select { |item| item.done? }
    
    assert_equal([@todo1], selected.to_a)
  end
  
end