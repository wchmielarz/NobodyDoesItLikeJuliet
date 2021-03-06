function merge(a::Array, b::Array)
  len = length(a) + length(b)
  B = Array(Int64, len)

  for k = 1:len

    if first(a) <= first(b)
      B[k] = shift!(a)
     else
       B[k] = shift!(b)
    end

    if isempty(a)
      return transfer_tail(B, b, k)
    elseif isempty(b)
      return transfer_tail(B, a, k)
    end

  end
end

function transfer_tail(arr::Array, tail::Array, count::Int64)
  for k = (count + 1):(length(tail) + count)
    arr[k] = shift!(tail)
  end
  return arr
end


function merge_sort(arr::Array)
    if length(arr) <= 1
       return arr
    end

    q = div(length(arr),2)

    a = merge_sort(arr[1 : q])
    b = merge_sort(arr[q + 1 : end])
    merge(a,b)
end

A = [3,6,5,8,99,2,1,5,9]
println(A)

A = merge_sort(A)
println(A)
