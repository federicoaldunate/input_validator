

class Challenge
  MIN_SIZE = 10
  MAX_SIZE = 15
  NUMBERS_AMOUNT = 3
  UPPERCASE_LETTERS = 4


  def initialize(input)
    @input = input
    @errors = []
  end

  attr_accessor :input, :errors

  def program
    validate
    do_stuff
  end

  private

  def validate
    validate_that_input_is_a_string!
    validate_size!
    validate_numbers_amount!
    validate_uppercase_letters!

    raise_errors(errors) if errors.length > 0
  end

  def do_stuff
    "Input: #{input}"
  end

  def validate_that_input_is_a_string!
    return if input.is_a? String
    raise_errors(["Input is not a string"])
  end

  def validate_size!
    return if input.length >= MIN_SIZE && input.length <= MAX_SIZE 

    error("The length of the input must be between #{MIN_SIZE} and #{MAX_SIZE} characters")
  end

  def validate_numbers_amount!
    # this code below could be more efficent if input is longer.
    #  we used a more readible code
    # counter = 0
    # input.each_char do |char|
    #   if char.ord >= 48 && char.ord <= 57
    #     counter += 1
    #   end
    #   break if counter >= NUMBERS_AMOUNT
    # end

    counter = input.count("[0-9]")

    return if counter >= NUMBERS_AMOUNT

    error("The input must include at least #{NUMBERS_AMOUNT} numbers")
  end

  def validate_uppercase_letters!
    # this code below could be more efficent if input is longer.
    #  we used a more readible code
    # counter = 0
    # input.each_char do |char|
    #   if /[A-Z]/.match(char)
    #     counter += 1
    #   end
    #   break if counter >= UPPERCASE_LETTERS
    # end
    

    counter = input.count("[A-Z]")

    return if counter >= UPPERCASE_LETTERS

    error("The input must include at least #{UPPERCASE_LETTERS} uppercase letters")
  end

  def error(error_message)
    errors << error_message
  end

  def raise_errors(errors)
    raise StandardError.new(errors.join(","))
  end
end
