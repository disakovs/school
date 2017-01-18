class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    @todos << item 
  end
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def done?
    @todos.all? { |todo| todo.done? }
  end
  
  def done!
    @todos.each{ |todo| todo.done! }
  end
  
  def <<(todo)
    raise TypeError, 'can only add Todo object' unless todo.instance_of? Todo  
    
    @todos << todo 
  end
  
  alias_method :add, :<<
  
  def last
    @todos.last
  end
  
  def pop
    @todos.pop
  end
  
  def shift
    @todos.shift
  end
  
  def item_at(num)
    @todos.fetch(num)
  end
  
  def remove_at(num)
    @todos.delete_at(num)
  end
  
  def mark_done_at(num)
    @todos.fetch(num).done!
  end
  
  def mark_undone_at(num)
    @todos.fetch(num).undone!
  end
  
  def to_s 
    text = "--- #{title} ---\n"
    text << @todos.map(&:to_s).join("\n")
    text 
  end
  
  def to_a
    @todos
  end
  
  def each
    index = 0 
    
    while index < @todos.size
      yield(@todos[index])
      index += 1
    end
    
    self
  end
  
  def select
    result = TodoList.new(title)
    
    each do |item|
      result << item if yield(item)
    end
    
    result
  end
  
  def find_by_title(string)
    result = select do |item|
      item == string
    end
    
    result.to_a.first
  end
  
  def all_done
    select { |item| item.done? }
  end
  
  def all_not_done
    select do |item|
      !item.done?
    end
  end
  
  def mark_done(string)
    find_by_title(string).done!
  end
  
  def mark_all_done
    each do |item|
      item.done!
    end
  end
  
  def mark_all_undone
    each { |item| item.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect