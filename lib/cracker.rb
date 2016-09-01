require "./lib/enigma"

file_1, file_2, date_string = ARGV

input_string = open(file_1).read.strip
enigma = Enigma.new

target = open(file_2, 'w')
target.write(enigma.cracker(input_string))
