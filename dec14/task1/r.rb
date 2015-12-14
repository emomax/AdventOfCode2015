data = '1113122113'

def speak(z)
  previous = ""
  current = z[0]
  count = 0
  final = ""
  z.each_char do |x|
    if x != current
      previous = current
      current = x
      final << count.to_s + previous
      count = 0
    end
    count += 1
  end
  final << count.to_s + current
  return final
end

1.upto(50) {
  data = speak(data) 
}

p data.length