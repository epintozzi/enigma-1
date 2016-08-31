require "./lib/enigma"

enigma = Enigma.new

#google command line arguments: read file (which returns message), pass to encprypt method (which returns encrypted string), write encrypted message to newly created file

file_1 = ARGV[0]
file_2 = ARGV[1]

message = open(file_1).read

encrypted_message = enigma.encrypt(message)


target = open(file_2, "w")

target.write(encrypted_message)
