class BottomUpMergeSort
  def sort(input)
    if input.empty?
      return
    end

    aux = Array.new(input.length)

    partition_size = 1
    while partition_size < input.length
      (0...(input.length - partition_size)).step(2 * partition_size) do |from|
        mid = from + partition_size - 1
        to = [from + (2 * partition_size) - 1, input.length - 1].min

        merge(input, aux, from, mid, to)
      end

      partition_size *= 2
    end
  end

  private
  def merge(input, aux, from, mid, to)
    for i in from..to
      aux[i] = input[i]
    end

    i = from
    j = mid + 1
    k = from
    while i <= mid or j <= to
      if j > to or (i <= mid and aux[i] < aux[j])
        input[k] = aux[i]
        i += 1
      else
        input[k] = aux[j]
        j += 1
      end
      k += 1
    end
  end
end