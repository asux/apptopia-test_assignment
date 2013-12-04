require 'spec_helper'

describe Apptopia::TestAssignment do
  it "returns a non-duplicates elements" do
    Apptopia::TestAssignment.non_duplicates([10, 1, 2, 10, 30, -1, 2]).should =~ [1, 30, -1]
  end
end
