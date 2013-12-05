module Apptopia::TestAssignment
  class TreeCollector
    # +tree+ parameter must respond to +value+, +left+, +right+
    def initialize(tree)
      @root = tree
      @collection = []
      @queue = []
    end

    def visit(node, level)
      @collection[level] ||= []
      @collection[level] << node.value
    end

    def enqueue(node, level)
      @queue.push [node, level]
    end

    def dequeue
      @queue.shift
    end

    def traverse
      enqueue @root, 0
      until @queue.empty?
        node, level = dequeue
        visit node, level
        enqueue node.left, level+1 if node.left
        enqueue node.right, level+1 if node.right
      end
      @collection
    end

    def to_a
      return @collection unless @collection.empty?
      traverse
    end
  end
end
