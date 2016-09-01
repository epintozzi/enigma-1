require "./lib/enigma"

input_file, output_file, date_string = ARGV

input_string = open(input_file).read
enigma = Enigma.new

target = open(output_file, 'w')
target.write(enigma.cracker(input_string))
