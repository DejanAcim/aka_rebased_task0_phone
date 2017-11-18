class Phone
  def initialize
    if ARGV.empty?
      puts 'Proper usage:'
      puts 'phone.rb number'
      exit
    end
  @number = ARGV[0]
  @digits = {
    ['A','B','C'] => '2',
    ['D','E','F'] => '3',
    ['G','H','I'] => '4',
    ['J','K','L'] => '5',
    ['M','N','O'] => '6',
    ['P','Q','R','S'] => '7',
    ['T','U','V'] => '8',
    ['W','X','Y','Z'] => '9',
  }
  end

  def get_number
    proper_number = []
    @number.each_char do |c|
      if @digits.keys.flatten.include?(c)
        @digits.each do |key, value|
          proper_number << value if key.include?(c)
        end
      elsif numeric?(c) || c == '-'
        proper_number << c
      else
        puts 'This is not a valid number. Please check.'
        exit
      end
    end

    puts proper_number.join('')
  end

  private

    def numeric?(lookAhead)
      lookAhead =~ /[[:digit:]]/
    end
end

Phone.new.get_number
