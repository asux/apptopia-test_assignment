$:.unshift File.dirname(__FILE__)

module Apptopia
  module TestAssignment
    autoload :TreeCollector, 'apptopia/test_assignment/tree_collector'
  end
end

require 'apptopia/test_assignment'
