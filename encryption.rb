# -------------- CLASS FOR HASHING AND DEHASHIN FOR WORDS ------------------

#===============================================================================

class Encoders

  #=============================================================================

  #----__METHOD__FIRST__(ENCRYPTION)-----
  def hasher(dataForHashing, how_Many_Hashes)

    #===========================================================================

    # Creating a hash for hashing the words given by user
    hashing_key = {

      # Mapping words to different words for hashing
      'a' => "*",
      'b' => "E",
      'c' => "A",
      'd' => "Y",
      'e' => "H",
      'f' => "3",
      'g' => "N",
      'h' => "I",
      'i' => "$",
      'j' => "0",
      'k' => "d",
      'l' => "7",
      'm' => "a",
      'n' => "g",
      'o' => "n",
      'p' => "V",
      'q' => "G",
      'r' => "j",
      's' => "+",
      't' => "(",
      'u' => "'",
      'v' => "-",
      'w' => "_",
      'x' => "?",
      'y' => "@",
      'z' => "P",
      '1' => "R",
      '2' => "s",
      '3' => "q",
      '4' => "F",
      '5' => "B",
      '6' => "J",
      '7' => "M",
      '8' => "t",
      '9' => "b",
      '0' => "6",
      'A' => "D",
      'B' => "l",
      'C' => "i",
      'D' => "8",
      'E' => "1",
      'F' => "c",
      'G' => "C",
      'H' => "=",
      'I' => "\\",
      'J' => "|",
      'K' => "!",
      'L' => "~",
      'M' => "/",
      'N' => "`",
      'O' => "<",
      'P' => ":",
      'Q' => ".",
      'R' => ">",
      'S' => ",",
      'T' => '"',
      'U' => ";",
      'V' => "9",
      'W' => "h",
      'X' => "e",
      'Y' => "o",
      'Z' => "m",
      '!' => "f",
      '@' => "w",
      '~' => "K",
      '`' => "S",
      '#' => "x",
      '$' => "X",
      '%' => "y",
      '^' => "k",
      '&' => "T",
      '*' => "v",
      '(' => "p",
      ')' => "z",
      '_' => "u",
      '-' => "L",
      '+' => "Q",
      '=' => "r",
      '|' => "Z",
      '\\' => "U",
      ']' => "[",
      '[' => "O",
      '{' => "W",
      '}' => "4",
      '"' => "#",
      "'" => "2",
      ':' => "^",
      ';' => "{",
      '?' => "%",
      '/' => ")",
      '.' => "&",
      '>' => " ",
      ',' => "5",
      '<' => "}",
      ' ' => ']',
      }

    #===========================================================================

    #===========================================================================
    #The veriable used in hashing fuction are as follow:

    hashed_word = '' #The Actual Finished hashed word
    temp_hash = '' #For storing temprary hashed characters
    num_Of_hashed = 1 #For how many times we have to hash the character

    #===========================================================================

    #----THIS__IS__THE__PART__WHERE__ACTUAL__HASHING__TAKES__PLACE -----

    #===========================================================================

    #If User Wants the default option
    if how_Many_Hashes.to_s == '0'
      how_Many_Hashes = 3
    end

    #===========================================================================

    #===========================================================================

    #Running each word seperatly to get mapped to different word
    (dataForHashing.length).times do |letter|
      #hasing the character from user input
      hashed = hashing_key[dataForHashing[letter]]

      #storing the upper ^ hashed char to temprary hashed veriable
      temp_hash = hashed

      #=========================================================================

      #Checking How Many Times the user want to hash and hashing the word
      while num_Of_hashed < how_Many_Hashes
        hashed = hashing_key[temp_hash]
        temp_hash = hashed

        #incrimenting the num_Of_hashed so that there is not infinite loop
        num_Of_hashed += 1
      end

      #=========================================================================

      num_Of_hashed = 1
      #Whatever the value we get for the char we stored it to the hashed word
      hashed_word += temp_hash

    end

    #===========================================================================

    #Returning the Finished hash of the word/Stentence to user
    return hashed_word

  end

  #=============================================================================

  # ----__METHOD__SECOND__(DECRYPTION)-----


  #=============================================================================

  # Creating a hash for hashing the words given by user
  def dehasher(ciphertext, times)

    #===========================================================================

    # Undoing the hash to get dehashed words
    hashing_key = {

      # Mapping words to different words for hashing
      "*" => 'a',
      "E" => 'b',
      "A" => 'c',
      "Y" => 'd' ,
      "H" => 'e',
      "3" => 'f',
      "N" => 'g',
      "I" => 'h',
      "$" => 'i',
      "0" => 'j',
      "d" => 'k',
      "7" => 'l',
      "a" => 'm',
      "g" => 'n',
      "n" => 'o',
      "V" => 'p',
      "G" => 'q',
      "j" => 'r',
      "+" => 's',
      "(" => 't',
      "'" => 'u',
      "-" => 'v',
      "_" => 'w',
      "?" => 'x',
      "@" => 'y',
      "P" => 'z',
      "R" => '1',
      "s" => '2',
      "q" => '3',
      "F" => '4',
      "B" => '5',
      "J" => '6',
      "M" => '7',
      "t" => '8',
      "b" => '9',
      "6" => '0',
      "D" => 'A',
      "l" => 'B',
      "i" => 'C',
      "8" => 'D',
      "1" => 'E',
      "c" => 'F',
      "C" => 'G',
      "=" => 'H',
      "\\" => 'I',
      "|" => 'J',
      "!" => 'K',
      "~" => 'L',
      "/" => 'M',
      "`" => 'N',
      "<" => 'O',
      ":" => 'P',
      "." => 'Q',
      ">" => 'R',
      "," => 'S',
      '"' => 'T',
      ";" => 'U',
      "9" => 'V',
      "h" => 'W',
      "e" => 'X',
      "o" => 'Y',
      "m" => 'Z',
      "f" => '!',
      "w" => '@',
      "K" => '~',
      "S" => '`',
      "x" => '#',
      "X" => '$',
      "y" => '%',
      "k" => '^',
      "T" => '&',
      "v" => '*',
      "p" => '(',
      "z" => ')',
      "u" => '_',
      "L" => '-',
      "Q" => '+',
      "r" => '=',
      "Z" => '|',
      "U" => '\\',
      "[" => ']',
      "O" => '[',
      "W" => '{',
      "4" => '}',
      "#" => '"',
      "2" => "'",
      "^" => ':',
      "{" => ';',
      "%" => '?',
      ")" => '/',
      "&" => '.',
      " " => '>',
      "5" => ',',
      "}" => '<',
      ']' => ' ',

  }

 #==============================================================================


 #==============================================================================

  #The veriable used in dehashing fuction are as follow:

  dehashed_word = '' #The Actual Finished dehashed word
  temp_dehash = '' #For storing temprary dehashed characters
  num_Of_dehashed = 1 #For how many times we have to hash the character

  #=============================================================================

  #----THIS__IS__THE__PART__WHERE__ACTUAL__HASHING__TAKES__PLACE -----

  #=============================================================================

  #If User Used the default option
  if times.to_s == '0'
    times = 3
  end

  #=============================================================================

  #=============================================================================

  #Running each word seperatly to get mapped to different word
  (ciphertext.length).times do |letter| #ciphertext = the hashed word
    #Dehasing the character from user input
    hashed = hashing_key[ciphertext[letter]]

    #storing the upper ^ hashed char to temprary Dehashed veriable
    temp_dehash = hashed

    #===========================================================================

    #Checking How Many Times the user want to Dehash and Dehashing the word
    while num_Of_dehashed < times
      hashed = hashing_key[temp_dehash]
      temp_dehash = hashed

      #incrimenting the num_Of_hashed so that there is not infinite loop
      num_Of_dehashed += 1
    end

    #===========================================================================

    num_Of_dehashed = 1
    #Whatever the value we get for the char we stored it to the Dehashed word
    dehashed_word += temp_dehash

  end

  #=============================================================================

  #Returning the Finished Dehash of the word/Stentence to user
  return dehashed_word
  #Returning the finished hash to the veriable/user who called it

  end
end

#===============================================================================


#----------THE END OF THIS FILE--------------------

#_____THIS IS ALL ABOUT ENCRYPTION IN MY APP.rb______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
