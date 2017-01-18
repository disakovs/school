class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < Exception; end 
  
  def initialize(spaces)
    @spaces = Array.new(spaces)
    @write_position = 0
    @read_position = 0
  end
  
  def write(element)
    return if element.nil?
    
    raise BufferFullException if full?
    
    @spaces[@write_position] = element
    write_position_increment
  end
  
  def write!(element)
    return if element.nil?
    
    read if full?
    write(element)
  end
  
  def size 
    @spaces.size 
  end
  
  def write_position_increment
    @write_position += 1 
    @write_position == size ? @write_position -= size : @write_position 
  end
  
  def read_position_increment
    @read_position += 1 
    @read_position == size ? @read_position -= size : @read_position 
  end
  
  def all_empty?
    @spaces.all? {|i| i.nil?}
  end
  
  def full?
    @spaces.all? {|i| !i.nil? }
  end
  
  def read
    raise BufferEmptyException if all_empty?
    
    deleted_item = @spaces[@read_position]
    @spaces[@read_position] = nil 
    read_position_increment
    deleted_item
  end
  
  def clear 
    initialize(size)
  end
end
