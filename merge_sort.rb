class MergeSort
  def sort(input)
    if input.empty?
      return
    end
    aux = Array.new(input.length)
    sort_portion(input, aux, 0, input.length - 1)
  end

private
  def sort_portion(input, aux, from, to)
    if from == to
      return
    end

    mid = from + ((to - from) / 2).floor
    sort_portion(input, aux, from, mid)
    sort_portion(input, aux, mid + 1, to)

    merge(input, aux, from, mid, to)
  end

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