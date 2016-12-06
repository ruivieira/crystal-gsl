module Sorting
  extend self

  def qsort(list : Array(Float64)) : Array(Float64)
    if list.size < 2
      return list
    end

    pivot = list.pop
    left = list.select { |x| x <= pivot }
    right = list.select { |x| x > pivot }

    return qsort(left) + [pivot] + qsort(right)
  end
end
