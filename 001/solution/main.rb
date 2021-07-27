sample = (1..16) # 16-2=14
sample2 = (-60..-44) # 6




# Solution #1
def fiver?(number)
  number.to_s.include? '5'
end

puts '#1: String include'

puts sample.to_a.count { |num| !fiver? num }
puts sample2.to_a.count { |num| !fiver? num }
puts '------'


# Solution #2 -- NOT WORKING~ Missing 51, 52, 53...
puts '#2: Modulo  but only work to find ending 5'

puts sample.to_a.count { |num| num.to_f / 5.0 % 2 != 1 }
puts sample2.to_a.count { |num| num.to_f / 5.0 % 2 != 1 }
puts '------'

# Solution #3
puts '#3: Complex regex'

puts sample.to_a.to_s.scan(/(\[| |-)[0-46-9]+(,|\])/).size
puts sample2.to_a.to_s.scan(/(\[| |-)[0-46-9]+(,|\])/).size
puts '------'
