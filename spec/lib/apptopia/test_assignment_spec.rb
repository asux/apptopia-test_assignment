require 'spec_helper'

TreeNode = Struct.new(:value, :left, :right)

describe Apptopia::TestAssignment do
  context :non_duplicates do
    it "returns a non-duplicates elements" do
      described_class.non_duplicates([10, 1, 2, 10, 30, -1, 2]).should =~ [1, 30, -1]
    end
  end

  context :tree_levels do
    let(:tree) do
      TreeNode.new(0,
        TreeNode.new(1,
          nil,
          TreeNode.new(2, nil, nil)
        ),
        TreeNode.new(3,
          TreeNode.new(4, nil, nil),
          TreeNode.new(5,
            TreeNode.new(6, nil, nil),
            nil
          )
        )
      )
    end
    it "calculates a valid tree levels" do
      described_class.tree_levels(tree).should eq [[0], [1, 3], [2, 4, 5], [6]]
    end
  end
end
