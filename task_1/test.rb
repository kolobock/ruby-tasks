require_relative 'message'

body = "The fact that so many people make so much effort on the internet to make other random people from around the world laugh/feel better is a great achievement of the human race."
expected = "The fact that so many people make so much effort on the internet to make other random people from around the world laugh..."
puts 'Test1 (long text): ', expected == Message.new(body).body
puts

body = '$' * 119
expected = body
puts 'Test2 (119): ', expected == Message.new(body).body
puts
puts

body = '$' * 120
expected = body
puts 'Test2 (120): ', expected == Message.new(body).body
puts
puts

body = '$' * 121
expected = "#{'$' * 120}..."
puts 'Test3 (121): ', expected == Message.new(body).body
puts
puts

print "Given message body: "
body = gets

message = Message.new(body)

puts '-' * 80
puts "Processed message: #{message.body}"
