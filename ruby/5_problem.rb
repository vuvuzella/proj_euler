def min_divisible(max)
    arr_num = Array.new
    for num in 1...max
        num_con = num
        while num_con > 1
            if num_con % 2 == 0
                num_con = consume_reduce(num_con, arr_num, 2)
            elsif num_con % 3 == 0
                num_con = consume_reduce(num_con, arr_num, 3)
            elsif num_con % 5 == 0
                num_con = consume_reduce(num_con, arr_num, 5)
            elsif num_con % 7 == 0
                num_con = consume_reduce(num_con, arr_num, 7)
            else
                arr_num.push(num_con)
                num_con = 1
            end
        end
    end
    return arr_num
end

def consume_reduce(num, arr_num, divisor)
    # if there is no 2, add 2 to array
    # else, for each 2 in array, divide num by 2.
    # if num is still divisible by 2, divide num by 2 and add 2
    if arr_num.include?(divisor)
        for two_num in arr_num.select { |elem| elem == divisor }
            num = num / divisor
        end
    end
    # Add additional 2's 
    while num % divisor == 0 && num != 1
        arr_num.push(divisor)
        num = num / divisor
    end
    return num
end

puts "Enter maximum number"
max_num = gets
prod = 1
for num in min_divisible(max_num.to_i)
    # puts num
    prod = prod * num
end

puts "Max number divisible by 1 to 20 is: #{prod}"