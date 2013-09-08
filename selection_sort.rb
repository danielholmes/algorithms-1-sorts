class SelectionSort
  def sort(input)
    for i in 0...(input.length - 1)
      smallest_index = i
      for j in (i + 1)...input.length
        if input[j] < input[smallest_index]
          smallest_index = j
        end
      end
      temp = input[i]
      input[i] = input[smallest_index]
      input[smallest_index] = temp
    end
  end
end