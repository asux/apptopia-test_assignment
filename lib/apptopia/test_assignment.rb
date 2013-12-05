module Apptopia::TestAssignment
  def self.non_duplicates(array)
    array.inject(Hash.new(0)) do |memo, item|
      memo[item] = memo[item] + 1
      memo
    end.select { |item, count| count == 1 }.keys
  end

  def self.tree_levels(tree)
    TreeCollector.new(tree).to_a
  end
end
