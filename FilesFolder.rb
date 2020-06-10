#===============================================================================

require_relative "names.rb" #For creating encrypted name for files
require_relative "encryption.rb" #For creating encrypted words in a file
require "colorize" #just for colouring the output of the fuctions

#===============================================================================

#===============================================================================

#Class which contains all our fuctions
class Working_With_Files

  #Getting the user location where we save data for user
  attr_accessor :location

  #=============================================================================

  #Creating all work automatic for user
  def initialize(location)
    self.location = location

    #===========================================================================

    begin

      #If there is not dir then creating one
      Dir.mkdir("#{location}/TheAPP.rb")

      #After Creating it changing dir to the created one
      Dir.chdir("#{location}/TheAPP.rb")

    #Seeing if we get a exist error meaning there is already a folder created
    rescue Errno::EEXIST

      #If there is a dir already just changing dir to the folder
      Dir.chdir("#{location}/TheAPP.rb")

    #If there is wrong dir path then this code will execute,
    rescue Errno::ENOENT
      puts "No Such Path Exists".red
      exit

    end

    #===========================================================================

  end

  #=============================================================================

#------___FUCTIONS___WHICH___OUR___CLASS___COULD___DO---------

  #=============================================================================

  #FUCTION 1st ==>> REMOVES file which are created by the user
  def file_Remove(fileName)

    #First it encryptes the user input
    encrypte = naming_Of_File(fileName)

    #===========================================================================

    #Now it check if there is a file or not
    begin

      #if there is a file then it will delete it
      File.delete(encrypte)
      return "#{fileName} file deleted successfully".yellow

    rescue
      #if there is not a file then it do this
      return "No Such File is there".red
    end

  #=============================================================================

  end

  #=============================================================================

  #FUCTION 2nd ==>> CREATES file which is encrypted the name also
  def file_Create(fileName)

    #First it encryptes the userInput to our mapped words
    encrypted = naming_Of_File(fileName)

    #Checking if file is already created or not
    file_Is_there = File.exists? encrypted

    #This Will Check What the value of file_Created if it is then,
    #if it is not then,

    #===========================================================================

    begin
      #if file is not created
      if !file_Is_there

        #If it is not created we will created it for the user..
        File.open(encrypted, 'w')
        return "File Created Successfully".yellow


      #else if file in there
      else
        return "File is already there".red

      end

    #If the file already created then this error will be poped up
    rescue initialize
      return "File Is Already Created".red
    end

  #=============================================================================

  end

  #=============================================================================

  #FUCTION 3rd ==> FINDS the file in the dir for the user
  def file_Find(fileName)

    #First it will encrypte the user Input
    encrypted = naming_Of_File(fileName)

    #Then it will checks if there is a file or not
    exitsts = File.exist? encrypted

    #===========================================================================

    #If there is!! a file then, this code will run
    if exitsts
      return "\"#{fileName}\" file is there".yellow

    #If not!! then, this code will run
    else
      return "There is no file named \"#{fileName}\"".red
    end
  end

  #=============================================================================

  #FUCTION 4th ==>> READS, WRITES & APPENDS a file for the user
  def file_Write(fileName, method)

    #First it will convert the method to lowercase in case it is uppercase
    method = method.downcase

    #This is the encrypted name of the user inputed fileName
    en_fileName = ''

    #===========================================================================

    #Checking if our fuction want's to check the passwords.txt file
    if fileName == 'passwords.txt'

      #We don't have to encrypte the name of this file
      en_fileName = 'passwords.txt'

    #If not our function the user wants file then this will first encrypt the name
    else

      #Now it will encrypte the user fileName to the ecrypted Name
      en_fileName = naming_Of_File(fileName)

    end

    #===========================================================================

    #Then it checks which method does the user entered
    case method
    when "w" #If user enters "w" means write then,

      #It will open the file in write mode
      File.open(en_fileName, 'w') do |line|

        #Ask data From the user to overwrite
        print ">> Type Data: ".yellow

        #Removes all unwanted words from the user Input
        data = gets.chomp()

        #Giving a short notice to the user
        puts ">> !!Always Remember This Number(Key)!!!  --- ONLY NUMBER ---".blue
        print ">> Give a Key For Encryption(any Number): ".yellow

        #Now it will asks for the key from which the user want's to encrypt the words
        encrypte_time = gets.chomp().to_i

        #Making the encoder class for encryption and decryption perposes
        encrypter = Encoders.new()

        #Now on the bases of user input it will encrypt the words in the file with the key
        data = encrypter.hasher(data, encrypte_time)
        line.write(data)

        return "Successfully Written in #{fileName} file".yellow

      end
      #=========================================================================

    #It will open the file in read mode
    when "r"
      #The words in the file will store here
      line_In_File = ''
      print "Give the key you used to encrypt this file: ".yellow

      #Getting the key from the user which is used to encrypt the file
      key = gets.chomp().to_i

      #This will fetch the words from the given file
      File.open(en_fileName, 'r') do |line|
        line_In_File = line.readline().to_s
      end

      ##Decrypting the words in the file on the basis of the key
      encoder = Encoders.new()
      decoded = encoder.dehasher(line_In_File, key)

      #Returning the decoded word to the user
      return ("File Data: ".green + decoded)

      #=========================================================================

    #It will open the file in Appending mode
    when "a"

      #Opening the fileName Which is encrypted by our fuction
      File.open(en_fileName, 'a') do |line|

        #Getting user data which to be appended on the file
        print ">> Type Data: ".yellow

        #Removing unwanted Elements from the user Input
        data = gets.chomp()

        # SOME basic BUT useful Message
        puts ">> !!What is the encryption key of this file"
        puts "________--------" + "NOTE NOTE NOTE".red + "------__________"
        puts ""
        puts ">>>**".yellow+" NOTE:".red+" USE THE SAME KEY WHICH YOU USE TO ENCRYPTE THE PEVIOUS DATA ELSE THERE ARE TWO KEYS USED".blue
        puts "                          FOR BOTH DATA DIFFERENTLY IN THIS FILE".blue+"***<<<<<".yellow
        puts ""
        puts "________--------" + "NOTE NOTE NOTE".red + "------__________"
        puts ""
        print ">> Encryption KEY: ".yellow


        #Taking the key from the user by which they want to encrypt the input and store in the file
        encrypte_time = gets.chomp().to_i

        #Checking if user typed a integer or string
        encrypte_time = encrypte_time + 0

        #=======================================================================
        #If typed integer then all good .. this code will run,
        if encrypte_time.to_s != '0'
          #making the hash of the input and storing in the file
          encrypter = Encoders.new()
          line.write(encrypter.hasher(data, encrypte_time))

          return "File Appended Successfully".yellow
        #=======================================================================

        #If the user typed a string then this code will execute
        else
          return "Only Numbers are Allowed".red
        end

        #=======================================================================

      end

    #===========================================================================

    #If the user type other the "w" or "a" or "r" then this error will generated
    else
      puts "Unkown mode Try USING(a, r, w) modes".red
    end

  end

  #=============================================================================

  #FUCTION 5th ==>> RENAMEING a existing file
  def file_rename(actualFile, rename) #taking the realName and changing name for the file

    #===========================================================================

    #Checking to See if the file is there or not
    begin
      #Encrypting the actual name of the file
      encrypted = naming_Of_File(actualFile)

      #Encrypting the replacing name of the file
      encrypted_name = naming_Of_File(rename)

      #Now renaming with the encrypted names
      File.rename(encrypted, encrypted_name)

      #Showing user which file is modified with which name
      return "#{actualFile} is renamed to #{rename}".yellow
      end

    #If there is no file which user Telled then, this will happen..
    rescue
      return "There is no such file called \"#{actualFile}\"".red
    end

    #===========================================================================

end

#===============================================================================

#----------THE END OF THIS FILE--------------------


#___WORKING__WITH___FILES___FUCTION__DONE

#_____THIS IS ALL ABOUT FILES AND DIR'S IN MY APP.rb______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
