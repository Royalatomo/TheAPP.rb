#-----------------------------------------------------------------------------------------------

require_relative "encryption.rb" #for encryption and decryption purposes
require_relative "FilesFolder.rb" #for working with files
require "colorize" #just for making words attractive

#-----------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

#This is just a documentation of this app which will be runned when the user first runs the app
def documentation()

  puts ""
  puts "--------------------------___" + "DOCUMENTATION".yellow  + "___" + "oF".yellow + "___" + "TheAPP.rb".yellow + "___---------------------------------------------"
  puts ""
  puts "  Hello !! ".red + "I am the developer of ".yellow + "TheAPPrb".red
  puts ""
  puts "  This is a documentation page if you like to read then please read".blue
  puts ""
  puts "  This documentation won't be displayed on your screen Next Time ...".green
  puts ""
  puts "  So first of all this App don't supports a key Exchange encryption i have not made it".yellow
  puts ""
  puts "  as complicated encryption as i could due to user convenience because it will too complicated".yellow
  puts ""
  puts "  to remember some big jumbled strings of words .... So i have made it as simple as possible".yellow
  puts ""
  puts "  i know that this encryption can be cracked by hackers easily .. I haven't made this encryption".yellow
  puts ""
  puts "  to be used at unsafed environment .. i just made it so that your data (private data) insen't".yellow
  puts ""
  puts "  stored on a plain text and some how will be encrypted ..".yellow
  puts ""
  puts "  USER PRECAUTION (".yellow+"SUPPER IMPORTANT".red+") : ---".yellow
  puts ""
  puts "  1)".red + " Never give this App's to any one so that they won't be able to see the encryption"
  puts "  	        part which i have used to encrypte the data ...."
  puts ""
  puts "  2)".red + " Never use the simple keys like 10, 30 .. Use something like 4356, 38563 .. (Supported nums 10000000)"
  puts ""
  puts "  3)".red + " Always Remember the file name even if you typed something like xyz.txt this .txt part is also encrypted"
  puts ""
  puts "  4)".red + " Nothing more .. Just stay relaxed and I will think in future for update so stay tuned .."
  puts ""
  puts "--------------------------___" + "DOCUMENTATION".yellow  + "___" + "oF".yellow + "___" + "TheAPP.rb".yellow + "___---------------------------------------------"
  puts ""
  puts ""
  puts ">> Lets First Make Your Account for Authentication Perposes --".green

end

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------

#this is used to create the nessecerry files and dir to the location
#    which the user want's the app to be stored his data .....
def location()

  #=============================================================================

  puts ">> Always Remember this location <<".red
  puts "Give The Location Where You Want to save the data: "

  #=============================================================================

  #This will first take the location from the user where to store all things
  locations = gets.chomp()

  #Then it will return back the location to the fuction which called it..
  return locations
end

#-------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------

#This is used to store the passwords and key of encryption for the user..
def pass()

  #=============================================================================

  #This will first show the user the documentation..
  documentation()
  puts "Give a password: ".green

  #=============================================================================


  #then it will ask to set a password for this App
  password = gets.chomp()

  #=============================================================================

  puts ">> This is a 2 factor Authentication <<".red
  puts "Give any number < 10000000"

  #=============================================================================

  #Then it will ask for a key so that is can encrypt the password with this key
  give_key = gets.chomp().to_i

  #Checking if the user typed nothing if he then the value of the key goes to 0 and
  #        the programme will tell the user to type a key ...
  key = 0

  #=============================================================================

  #This is where the length of the key will be checked
  if give_key <= 0

    #if it is too small then this will not accept it
    puts "Give a strong key".red
    exit

  #If it is perfect for the app then it will accept the key

  #=============================================================================

  #=============================================================================
  elsif give_key <= 10000000

    #And it will set the accepted key to the key veriable for storing..
    key = give_key
    puts "Done >> Always remember this key".yellow

  #If it is too large for the app to process then it will not accept it

  #=============================================================================

  #=============================================================================

  elsif give_key > 10000000
    puts "Too long".red
    exit

  #Else if the user type wrong words then,

  #=============================================================================

  #=============================================================================

  else
    puts "Only Nums are allowed"
  end

  #=============================================================================

  #=============================================================================================

  #Now it will ask for the user to set location where the app data would be stored
  #      and store that location to path variable...
  path = location()

  #after it there is a instence would be created for Working_With_Files class for creating files
  files_folder = Working_With_Files.new(path)

  #after it there is a instence would be created for Encoders class for encrypting and de ..
  encrypted_pass = Encoders.new()

  #then the password will be hashed/encrypted by the key supplied by the user..
  data = encrypted_pass.hasher(password, key)

  #================================================================================================

  #=============================================================================

  #then it will write the encrypted password in the passwords.txt file
  File.open("#{path}/TheAPP.rb"+"/passwords.txt", 'w') do |line|

    line.write(data)

    puts "Done!! All Setup Ready to launch the app"

  end

  #=============================================================================

end

#----------------------------------------------------------------------------------------------

#----------THE END OF THIS FILE--------------------


#___WORKING__WITH___CREATING__ACCOUNT__AND__OTHER__THINGS

#_____THIS IS ALL ABOUT SETTING UP EVERY NECCESSARY THING NEEDED BY ALL FUCTIONS______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
