class InsertionSort
  def sort(input)
    for i in 1...input.length
      for j in (0..(i - 1)).to_a.reverse
        if input[j + 1] < input[j]
          input[j + 1], input[j] = input[j], input[j + 1]
        else
          break
        end
      end
    end
  end
end