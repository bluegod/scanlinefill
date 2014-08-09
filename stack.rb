# Scanline-fill <James.Lopez at bluegod.net>
# GPLv2 License

#Basic stack structure - similar to array in Ruby but has a limit
#where it starts shifting elements. The better alternative would be to
#stop there and output a warning (stack is full)
class Stack

  include Enumerable

  def initialize(max = 1000)
    @size = max
    @queue = Array.new
  end

  def each(&blk)
    @queue.each(&blk)
  end

  def pop
    @queue.pop
  end

  def empty?
    @queue.empty?
  end

  def push(value)
    full_action() if @queue.size >= @size
    @queue.push(value)
  end

  #Shifts queue if array is full
  #We may want to adapt this method to output a warning instead
  #(called when the stack has reached full capacity)
  def full_action
    @queue.shift
  end

  def to_a
    @queue.to_a
  end

  def <<(value)
    push(value)
  end

end