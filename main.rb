#------------- MAIN FILE WHICH CONNECTS ALL FUCTION TOGETHER -----------

#===============================================================================

require_relative "FilesFolder.rb" #This is for working with files
require_relative "login.rb" #This is for login/Authenticating user
require "colorize" #This is just to make text attractive

#===============================================================================

#===============================================================================

#If the user start it for the first time then temp.rb file will there
begin
  require_relative "temp.rb"

#When user setup all things then this file got deleted to handle the error doing this,
rescue LoadError
end

#===============================================================================

#===============================================================================

begin

  original_path = Dir.pwd().to_s

  #This is a fuction in temp.rb file
  pass()

#When temp.rb file deleted this fuction won't be there so handling error
rescue NoMethodError
end

#===============================================================================

#Checking where the user stored TheAPP.rb for deleting the temp.rb file


#Changing dir and deleting
begin

  #Changing dir to where the TheAPP.rb is stored
  Dir.chdir(original_path)

  #After setup deleting temp.rb
  File.delete('temp.rb')
  puts "Please Rerun this file!! ".green
  exit

#If temp.rb alerady deleted then do nothing,
rescue Errno::ENOENT

end

#===============================================================================

puts "THE APP".yellow + "--".green + "RUBY".red

#Checking if the user want's to exit or not
want_to_quit = false

#===============================================================================

#Short Notice to the user
puts ""
puts "!!>> This APP is created for private use and having too much complicated encryption".red
puts "          USE AT YOUR OWN RIST <<!!".red
puts ""

#===============================================================================

#===============================================================================

#Authentication user By Giving the login screen
user_info = loginForuser()

#This is the pass which the user given now,
user_pass = user_info[0]

#This is the file location in which user is telling TheAPP.rb folder is saved
user_location = user_info[1]

#This is the original password which is in the file
real_pass = user_info[2]

#Creating a instence for the Working_With_Files class to use its fuction in future,
files_Folders = Working_With_Files.new(user_location)

#===============================================================================

#---------THE___ACTUAL___APP___WORK___STARTS___FROM___HERE-----------

#===============================================================================

#Checking if the user want_to_quit value is not true meaning the user does not want's to quit..
while want_to_quit != true

  #=============================================================================

  #Checking if the user typed correct password by comparing the typed pass with the stored one..
  if user_pass != real_pass

    #If both password does not match then this whole app will not run..
    puts ""
    puts "Wront Key/Password".red
    exit
  end

  #=============================================================================

  #Giving a short help to the user

  puts ""
  puts "press" + " h".green
  print ">> "

  #Taking the options from the user to execute certain task based on the user's choice..
  input = gets.chomp().downcase()

  #===============================================================================

  #If user want's to see help then this code will gets executed..
  if input == 'h'
    puts  """
    h => Help,
    q => quit,
    fc => Creating a File,
    fr => Renaming a File,
    fd => Deleting a File,
    ff => Find a File,
    wa => Writing a file in append mode,
    ww => OverWriting a file,
    wr => Reading from a file..
    """
    puts ""

  #=============================================================================

  #If user want's to exit the want_to_quit will get true and the loop gets exited
  elsif input == 'q'
    puts "Thanks for using this app".yellow
    puts "CREATED by: BINGO".green

    #adding true to the veriable
    want_to_quit = true

  #=============================================================================

  #=============================================================================

  #If the user want's to create a file then,
  elsif input == 'fc'
    puts ""
    puts "--- This is A File Creating Fuction ---".green
    print 'Give the file a Name: '.green

    #It will take by which name the user want's to create the file
    fileName = gets.chomp

    #This code will run the ""file_Create"" FUNCTION of the ""Working_With_Files"" class
    puts files_Folders.file_Create(fileName)


  #=============================================================================

  #=============================================================================

  #If the user want's to delete a file which he created then,
  elsif input == 'fd'
    puts ""
    puts "--- This is A File Deleting Fuction ---".green
    print "Give the file Name: "

    #It will first ask for the name of the file to delete
    fileName = gets.chomp

    #then it will run ""file_Remove"" FUNCTION of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_Remove(fileName)

  #=============================================================================

  #=============================================================================

  #If the user want's to find a file to see it's there or not
  elsif input == 'ff'
    puts ""
    puts "--- This is A File Finding Fuction ---".green
    print "Give the file Name: "

    #It will first ask for the name of the file to find
    fileName = gets.chomp

    #then it will run ""file_Find"" FUNCTION of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_Find(fileName)

  #=============================================================================

  #=============================================================================

  #If the user want's to overwrite a file then,
  elsif input == 'ww'
    puts ""
    puts ("--- This is A File Wring Fuction In" + " OverWriting Mode".yellow + " ---".green)
    print "Give the file Name: "

    #It will first asks for the file name to overwrite
    fileName = gets.chomp

    #then it will run ""file_Write"" FUNCTION with "w" mode of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_Write(fileName, 'w')

  #=============================================================================

  #=============================================================================

  #If the user want's to append data on the file then,
  elsif input == 'wa'
    puts ""
    puts ("--- This is A File Wring Fuction In" + " Append Mode".yellow + " ---".green)
    print "Give the file Name: "

    #It will fist asks for the file name to append data on
    fileName = gets.chomp

    #then it will run ""file_Write"" FUNCTION with "a" mode of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_Write(fileName, 'a')

  #=============================================================================

  #=============================================================================

  #If the user want's to read data from the file then,
  elsif input == 'wr'
    puts ""
    puts ("--- This is A File Wring Fuction In" + " Reading Mode".yellow + " ---".green)
    print "Give the file Name:"

    #First it will ask for the file name which the user want's to read
    fileName = gets.chomp

  #then it will run ""file_Write"" FUNCTION with "r" mode of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_Write(fileName, 'r')

  #=============================================================================

  #=============================================================================

  #If the user want's to rename a existing file then,
  elsif input == 'fr'
    puts ""
    puts "--- This is A File Renaming Fuction ---".green
    print "Give the file Name You want to change: "

    #First it will ask for the actual name of the file which have to be renamed
    actualFile = gets.chomp
    print "Give the new Name For the file: "

    #then it will ask for the new name for the file..
    rename = gets.chomp

    #then it will run ""file_rename"" FUNCTION of the ""Working_With_Files"" class
    puts ""
    puts files_Folders.file_rename(actualFile, rename)

  #=============================================================================

  #Else if the user typed a wrong or unkown command then,
  else
    #He will get this little error
    puts ""
    puts "Wrong Option is Used!!".red
  end

  #=============================================================================

end

#===============================================================================

#----------THE END OF THIS FILE--------------------


#___WORKING__WITH___ALL__THE__FUCTIONS

#_____THIS IS ALL MAKING COORDINATION AMOUNG ALL THE FUCTIONS______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
