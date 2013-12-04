module Apptopia::TestAssignment
  def self.non_duplicates(array)
    array.inject(Hash.new(0)) do |memo, item|
      memo[item] = memo[item] + 1
      memo
    end.select { |item, count| count == 1 }.keys
  end
end
