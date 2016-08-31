require "./lib/enigma"
require './lib/key_generator'

enigma = Enigma.new
key = Key.new

file_1 = ARGV[0]
file_2 = ARGV[1]

message = open(file_1).read

key = key.key_generator

encrypted_message = enigma.encrypt(message, key, date=Date.today)

target = open(file_2, "w")

target.write(encrypted_message)

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
