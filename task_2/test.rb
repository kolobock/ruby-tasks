require_relative 'array'

array = [
  (1..2).to_a,
  (5...11).to_a,
  (12..18).to_a,
  11
]

puts "Given: #{array}"

array.rebuild! do |element|
  element + 3
end
pp 'Test 1:', array

array.rebuild! do |element, size|
  element + size
end
pp 'Test 2:', array

array.rebuild! do |element, r|
  element + 1
end
pp 'Test 3:', array

array.rebuild! do |element, size, all|
  element + size + all
end
pp 'Test 4:', array
