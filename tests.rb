require "./selection_sort"
require "test/unit"

# TODO: Stability tests where applicable

module SortTests
  def test_many
    [
        [[], []], # No elements
        [[1], [1]], # Single element
        [[1, 2, 3], [2, 3, 1]], # Small shuffles
        [[1, 2, 3, 4, 5], [5, 4, 3, 2, 1]], # Reverse sorted
        [[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7]], # Already sorted
        [[1, 2, 2, 2, 3, 4, 4], [3, 2, 4, 2, 2, 4, 1]], # Duplicate keys
        [[2, 2, 2, 2, 2], [2, 2, 2, 2, 2]] # All Duplicate keys
    ].each {|args|
      array = args[1]
      expected = args[0]

      perform_sort(array)

      assert_equal(expected, array)
    }
  end

  def perform_sort(input)
    create_sort().sort(input)
  end

  def create_sort
    raise "create not implemented"
  end
end

class SelectionSortTest < Test::Unit::TestCase

  include SortTests

  def create_sort
    SelectionSort.new
  end

end