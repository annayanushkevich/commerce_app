puts "please enter password:"
password = gets.chomp

def encryption_password(password)
  encryption_password = 1
  letters = password.split("")
  letters.each do |letter|
    encryption_password = encryption_password * letter.ord


    require 'benchmark'
    require 'bcrypt'

    def break_password(encryption_password)
      count = 0
      ('aaaaa'..'zzzzz').each do |word|
        count +=1
        puts word
        if encryption_password(word) == encryption_password
          puts "password broken"
        else
          