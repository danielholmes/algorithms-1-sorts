require "./selection_sort"
require "./insertion_sort"
require "./merge_sort"
require "./bottom_up_merge_sort"
require "test/unit"

module SortTests
  def test_many
    [
        [[], []], # No elements
        [[1], [1]], # Single element
        [[1, 2, 3], [2, 3, 1]], # Small shuffles
        [(1..8).to_a, [8, 2, 5, 4, 6, 7, 1, 3]], # Binary boundary
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

class InsertionSortTest < Test::Unit::TestCase
  include SortTests

  def create_sort
    InsertionSort.new
  end
end

class MergeSortTest < Test::Unit::TestCase
  include SortTests

  def create_sort
    MergeSort.new
  end
end

class BottomUpMergeSortTest < Test::Unit::TestCase
  include SortTests

  def create_sort
    BottomUpMergeSort.new
  end
end