class Converter

  attr_reader :dictionary_array
  def initialize(dictionary_file)

    @dictionary_array = []

    raw_dict = File.open(dictionary_file).read
    raw_dict.each_line do |word|
      word.gsub!("\n", '')

      @dictionary_array << [word.downcase.split("").map{|x| word_code(x)}.join.to_i, word.downcase]
    end
    @dictionary_array.sort!
    @dictionary_array.each_with_index.map do |el, i|
      next if i == 0
      if el[0] == @dictionary_array[i-1][0]
        el << @dictionary_array[i-1][1,2000]
        @dictionary_array[i-1][1] = nil
      end
    end
    @dictionary_array.reject! {|el| el[1] == nil }
  end

  def convert(ten_digits)
    
  end


  private

  def word_code(word)
    word.chars.map do |char|
      case char
        when 'a', 'b', 'c'
          2
        when 'd','e','f'
          3
        when 'g','h','i'
          4
        when 'j', 'k', 'l'
          5
        when 'm', 'n', 'o'
          6
        when 'p', 'q', 'r', 's'
          7
        when 't', 'u', 'v'
          8
        when 'w', 'x', 'y', 'z'
          9
      end
    end
  end

end



converter = Converter.new('dictionary2.txt')