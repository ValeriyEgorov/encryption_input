require 'digest'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите слово или фразу для шифрования:"

phrase = STDIN.gets.chomp

puts "Каким способом зашифровать?"
puts "1. MD5"
puts "2. SHA1"

choise = STDIN.gets.chomp

case choise
when "1"
  puts Digest::MD5.hexdigest phrase
when "2"
  puts Digest::SHA1.hexdigest phrase
else
  puts "Вы не выбрали метод шифрования"
end

