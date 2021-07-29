require 'bigdecimal'

# Generic methods
def g_kmh
  BigDecimal('9.81', 10) * ms2_to_kmh2
end

def ms2_to_kmh2
  BigDecimal('0.001', 10) / s_to_hour
end

def s_to_hour
  BigDecimal(1, 10) / BigDecimal('3600', 10)
end

def height(time_tenth, speed_kh)
  time_second = BigDecimal(time_tenth, 10) / 10
  speed_kh * time_second - BigDecimal('0.5', 10) * g_kmh * time_second * time_second
end

# Solution 1
puts 'First solution:'

def max_ball1(speed_kh)
  heights = [0]
  time_tenth = 0

  until heights[time_tenth - 1] > heights[time_tenth] do
    time_tenth += 1

    heights << height(time_tenth, speed_kh)

    puts "(#{time_tenth} - #{heights.last}"
  end

  time_tenth - 1 # We exit the loop at t = max + 1
end

puts max_ball1(15)
puts max_ball1(25)
puts '---------------'

# Solution 2
puts 'Second solution:'

def max_ball2(speed_kh)
  heights = { prev: 0, curr: 0 }
  time_tenth = 0

  loop do
    time_tenth += 1

    heights[:prev] = heights[:curr]
    heights[:curr] = height(time_tenth, speed_kh)

    puts "(#{time_tenth} - #{heights[:curr]}"

    break if heights[:prev] > heights[:curr]
  end

  time_tenth - 1 # We exit the loop at t = max + 1
end

puts max_ball2(15)
puts max_ball2(25)
puts '---------------'
