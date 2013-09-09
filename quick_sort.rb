class QuickSort
  def sort(input)
    #input.shuffle!
    sort_segment(input, 0, input.length - 1)
  end

private
  def sort_segment(input, from, to)
    if from >= to
      return
    end

    pivot = partition(input, from, to)

    sort_segment(input, from, pivot - 1)
    sort_segment(input, pivot + 1, to)
  end

  def partition(input, from, to)
    pivot = from
    i = from
    j = to + 1

    while true
      i += 1
      while input[i] < input[pivot]
        if i == to
          break
        end
        i += 1
      end

      j -= 1
      while input[pivot] < input[j]
        if j == pivot
          break
        end
        j -= 1
      end

      if i >= j
        break
      end

      input[i], input[j] = input[j], input[i]
    end
    input[pivot], input[j] = input[j], input[pivot]

    j
  end
end