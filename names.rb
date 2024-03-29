#THIS FILE IS USED FOR NAMING THE FILE

#===============================================================================

#__METHOD__FIRST__==>>__Hashing__the__name
def naming_Of_File(name)

  #=============================================================================

  #Mapping the userInput name with others for Symmatric Encryption
  hashing_the_name = {
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

  #=============================================================================

  hashed_word = ''

  #=============================================================================

  #hasing these words only one time
  (name.length).times do |num|
    hasher = hashing_the_name[name[num]]
    hashed_word += hasher
  end

  #=============================================================================

  #Returning the hashed name to the user
  return hashed_word

  #=============================================================================

end

#===============================================================================

#__METHOD__SECOND__==>>__Dehashing__the__name
def de_Naming_Of_File(ciphere)

  #=============================================================================

  #Mapping the Encrypted name with others for Symmatric Decryption
  deHashing_the_name = {
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

  #=============================================================================

  deHashed_word = ''

  #=============================================================================

  #Dehasing these words only one time
  (ciphere.length).times do |num|
    dehasher = deHashing_the_name[ciphere[num]]
    deHashed_word += dehasher
  end

  #=============================================================================

  #=============================================================================

  #Returning the Dehashed name to the user
  return deHashed_word

  #=============================================================================

end

#----------THE END OF THIS FILE--------------------

#_____THIS IS ALL ABOUT NAMING FILES IN MY APP.rb______

#__CREATED__THIS__FILE__BY__RAHUL__BINGO!!__
