require "./lib/enigma"

enigma = Enigma.new

file_1 = ARGV[0]
file_2 = ARGV[1]
key    = ARGV[2]
date_s = ARGV[3]

date = Date.strptime(date_s, '%m%d%y')

message = open(file_1).read

decrypted_message = enigma.decrypt(message, key, date)

target = open(file_2, "w")

target.write(decrypted_message)

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
