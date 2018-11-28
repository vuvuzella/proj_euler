
def largest_palindrome_product()
    # count down until first product is a palindrome
    # improvement: dynamic programming version
    range = 999...0
    largest = 0
    range.first.downto(range.last).each do |num_1|
        range.first.downto(range.last).each do |num_2|
            prod = num_1 * num_2
            if isPalindrome(prod)
                if prod > largest
                    puts "num_1: #{num_1}, num_2: #{num_2}, result: #{num_1 * num_2}"
                    largest = prod
                end
            end
        end
    end
end

def isPalindrome(num)
    num_str = num.to_s
    len = num_str.size

    (0..len/2).each do |i|
        begn = num_str[i]
        last = num_str[(len - 1) - i]
        # puts "beginning: #{begn}, Last: #{last}"
        if begn == last
            # palindrome, do nothing
        else
            return false
        end
    end
    return true
end

# puts "Enter a number"
# num = gets
# print "Is #{num.strip!} palindrome: "
# puts isPalindrome(num.to_i)

largest_palindrome_product()