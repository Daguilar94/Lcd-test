#David Aguilar Hernández

#This algorith consist in displaying an 'LCD' number, given by the user, with characters '-' and '|'.
#Each digit is splited in 5 regions: three regions for horizontal segments (upper, center and lower segments) and two
#regions where the vertical segments will be displayed.

#The regions for horizontal segments have have 3 options: on, off or none.
#On: Displays the segments with spaces between.
#Off: Doesnt't display de segment, but white spaces instead.
#None: Dosen't display anything in the region.

#The regions for vertical segments will have 4 options: right, left, both or none.
# Right: Displays a single right vertical segment in the region.
# Left: Displays a single left vertical segment in the region.
# Both: Displays both, left and right vertical segments in the region.
# None: Doesn't display any segment in the region

#The whole numbers will be displayed region by region.


class LcdPrinter

  attr_accessor :user_input

  #Initialize class with users's input
  def initialize(input)
    @user_input = input
  end

  #Set the space between the digits
  @@digit_space = ' '

  #Set the five regions in which the numbers will be splited from lower to upper sections.

  @@regions = [
    'Horizontal Region',
    'Vertical Region',
    'Horizontal Region',
    'Vertical Region',
    'Horizontal Region'
  ]

  @@num_regions = @@regions.length

  #Set the segment configuration for each digit.
  @@digit_information = {
    '0' => ['on', 'both', 'off', 'both', 'on'],
    '1' => ['off', 'right', 'off', 'right', 'off'],
    '2' => ['on', 'right', 'on', 'left', 'on'],
    '3' => ['on', 'right', 'on', 'right', 'on'],
    '4' => ['off', 'both', 'on', 'right', 'off'],
    '5' => ['on', 'left', 'on', 'right', 'on'],
    '6' => ['on', 'left', 'on', 'both', 'on'],
    '7' => ['on', 'right', 'off', 'right', 'off'],
    '8' => ['on', 'both', 'on', 'both', 'on'],
    '9' => ['on', 'both', 'on', 'right', 'on']
  }

  #Set error messages variables
  @@errors = []

  def displayNumber()
    #Reset errors array
    @@errors = []

    #Validate user's input before proceeding to logic.
    if validate_input(@user_input) == true
      @user_input.split(' ').each do |set|

        #Set variables to each set of number and size.
        input_set = set.split(',')
        size = input_set[0].to_i
        number = input_set[1]
        number_array = number.split('')

        #End if end statement is reached
        break if (size == 0) && (number == '0')

        #Print number
        temporal_regions = set_regions

        @@num_regions.times do |i|

          #Start filling regions from the upper to the lower
          case temporal_regions.pop
          when 'Horizontal Region'
            print_horizontal_region(number_array, i, size)

          when 'Vertical Region'
            print_vertical_region(number_array, i, size)
          else
            return 'Invalid digit region'
          end
        end

        #Give two line breaks to separate each set of numbers
        print "\n" * 2
      end

      return 'Number(s) sucsessfully displayed'
    else
      #Return error message to the user
      puts "#{@@errors[0]}"
      return "#{@@errors[0]}"
    end
  end

  private

  #This method resets the regions array for the next number
  def set_regions
    return (
      [
        'Horizontal Region',
        'Vertical Region',
        'Horizontal Region',
        'Vertical Region',
        'Horizontal Region'
      ]
    )
  end

  def validate_input(input)
    #validates that the input has the end statement
    if (/0,0/ =~ input) == nil
      @@errors << 'You must write 0,0 in your input to end the application'
      return false
    end

    input.split(' ').each_with_index do |set, index|

      number_pair = set.split(',')

      #Validates input sets only have two numbers
      if number_pair.length != 2
        @@errors << 'Your input must be composed by pairs of numbers separated by a white space, like: 2,345 3,1994 0,0'
        return false
      end

      #Validates that input doesn't contain letters
      if (number_pair[0].match(/[a-zA-Z]/) != nil || number_pair[1].match(/[a-zA-Z]/) != nil)
        @@errors << 'Only numbers are accepted'
        return false
      end

      #Validates size is between 1 and 10
      if (number_pair[0].to_i < 0 || number_pair[0].to_i > 10)
        @@errors << 'Size must be a number between 1 and 10'
        return false
      end

      #Validates if there is a size equal to 0 before the end statement
      if (number_pair[0].to_i == 0 && (index + 1) < input.split(' ').length)
        @@errors << 'Size must be greater than 0'
        return false
      end
    end
    return true
  end

  #This method completes the horizontal region according to the digits of the current number
  def print_horizontal_region(array, region, size)
    line = ''
    array.each do |digit|
      option = @@digit_information[digit][region]
      line += add_horizontal_segment(option, size)
    end
    print line + "\n"
  end

  #This method completes the vertical region according to the digits of the current number
  def print_vertical_region(array, region, size)
    size.times do |t|
      line = ''
      array.each do |digit|
        option = @@digit_information[digit][region]
        line += add_vertical_segment(option, size)
      end
      print line + "\n"
    end
  end

  #This method displays an horizontal segment acording to the current option
  def add_horizontal_segment (option, size)
    case option
    when 'on'
      return ' ' + ('-' * size) + ' ' + @@digit_space
    when 'off'
      return ' ' + (' ' * size) + ' ' + @@digit_space
    else
      return 'Invalid horizontal region option'
    end
  end

  #This method displays an vertical segment acording to the current option
  def add_vertical_segment (option, size)
    case option
    when 'right'
      return ' ' + (' ' * size) + '|' + @@digit_space
    when 'left'
      return '|' + (' ' * size) + ' ' + @@digit_space
    when 'both'
      return '|' + (' ' * size) + '|' + @@digit_space
    when 'none'
      return ' ' + (' ' * size) + ' ' + @@digit_space
    else
      return 'Invalid vertical region option'
    end
  end
end

#UNCOMMENT THE FOLLOWING LINES TO USE THE APPLICATION AS A CONSOLE GAME

# print "Enter the size and numbers to display, ending with 0,0: "
# input = gets.chomp
# print1 = LcdPrinter.new(input)
# print1.displayNumber
