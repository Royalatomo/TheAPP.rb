#--------------------------------------------------------------------------------------------

require_relative "encryption.rb" #function for handling encryption and decryption
require_relative "FilesFolder.rb" #fuction for working with files
require "colorize" #just for colouring the output of the fuctions

#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------

#Main fuction responsible for login perposes
def loginForuser()

  #=============================================================================

  puts ""
  puts "LOGIN: ".red + "To use this App we Need to Authenticate You First".yellow
  # ------------------ STARTING ---------------
  puts ""
  print "Give the location where you stored: ".green

  #=============================================================================

  #=============================================================================

  #Asking the user to specify the path where the app data is stored
  file_path = gets.chomp()

  #added TheAPP.rb folder into the path supplied by the user
  full_path =  file_path + '/TheAPP.rb'

  #Checking if there is a path in which TheAPP.rb folder is created
  exits = File.exists? full_path

  #=============================================================================


  #=============================================================================

  #If created then,
  if exits

    print "Give the password: "

    #Asking for the user to give the password which he stored when first launching this app
    password_Of_User = gets.chomp()

    print "Give the key (Pin) used in sing up: ".yellow

    #Asking for the user to give the pin/key which he used to encrypt the password..
    key = gets.chomp().to_i


    #Changing the dir to that location and seeing if all the credentials are correct...
    Dir.chdir(full_path)

    #This is where the real_pass stored in the file would be placed
    real_pass = ''

    #===========================================================================

    #This will fetch the words from the passwords.txt file to check the password
    File.open('passwords.txt', 'r') do |line|
      real_pass = line.readline().to_s
    end

    #===========================================================================

    #decrypting the password which is stored in the passwords.txt file
    encoder = Encoders.new()
    decoded = encoder.dehasher(real_pass, key)

    #Returning the user_Password, the real password and the location of the dir
    return password_Of_User, file_path, decoded

  #=============================================================================

  #=============================================================================

  #If TheAPP.rb folder does not exists in this path then,
  else
    puts "This is not the folder where the data is stored!! ".red
    exit
  end

  #=============================================================================

end
#----------------------------------------------------------------------------------------------------------


#----------THE END OF THIS FILE--------------------


#___WORKING__WITH___LOGIN__FUCTION__DONE

#_____THIS IS ALL ABOUT LOGIN AND AUTHENTICATING IN MY APP.rb______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
