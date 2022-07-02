require_relative "node.rb"
class MyStack
    # attr_accessor :first, :last # first is the top element
    attr_reader :size
    def initialize
        @size = 0
        @first = nil
        @last = nil
    end

    def push(ele)

        new_node = Node.new(ele)
        if(!@first)
            @last = new_node
        else
            new_node.next = @first
        end
        @first = new_node
        @size += 1
        @size
    end

    def pop
        return nil if @size == 0
        curr_node = @first
        @last = nil if @size == 1
        @first = curr_node.next
        curr_node.next = nil
        @size -= 1
        return curr_node.val
    end

    def print
        curr = @first
        while(curr != @last)
            puts curr.val
            curr = curr.next
        end 
    end

end

class MyQueue
    attr_reader :size
    def initialize
        @size = 0
        @first = nil
        @last = nil # add stuff to end of line
    end

    def enqueue(val)
        new_node = Node.new(val)
        if(!@first)
            @first = new_node
        else
            @last.next = new_node
        end
        @last = new_node
        @size += 1
        self
    end

    def dequeue
        return nil if !@first
        temp = @first
        if(@first != @last)
            @first = temp.next
            temp.next = nil
        else
            @first = nil
            @last = nil
        end
        @size -= 1
        return temp.val
    end

    def print
        curr = @first
        while(curr != @last)
            puts curr.val
            curr = curr.next
        end

    end
end

if __FILE__ == $PROGRAM_NAME
    puts "----------- Stack test -----------"
    mystack = MyStack.new
    p mystack.push(75)
    p mystack.pop
    p mystack.push("Happy")
    p mystack.push("Yes it is")
    mystack.print
    # p calls #inspect
    # puts and print call to_s
    puts "---------Queue test ----------"
    testQueue = MyQueue.new
    testQueue.enqueue("Hi")
    testQueue.enqueue("how")
    testQueue.enqueue("are")
    testQueue.enqueue("you")
    testQueue.enqueue("now")

    testQueue.print
    p testQueue.dequeue
    p testQueue.dequeue
    testQueue.print
end