class MergeSort
  def sort(input)
    if input.empty?
      return
    end
    sort_portion(input, 0, input.length - 1)
  end

private
  def sort_portion(input, from, to)
    if from == to
      return
    end

    mid = from + ((to - from) / 2).floor
    sort_portion(input, from, mid)
    sort_portion(input, mid + 1, to)

    merge(input, from, mid, to)
  end

  def merge(input, from, mid, to)
    result = []
    i = from
    j = mid + 1
    while i <= mid or j <= to
      if j > to or (i <= mid and input[i] < input[j])
        result.push input[i]
        i += 1
      else
        result.push input[j]
        j += 1
      end
    end

    for i in from..to
      input[i] = result[i - from]
    end
  end
end