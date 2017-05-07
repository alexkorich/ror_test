class Converter

  def initialize(dictionary_file)
    @dictionary_array = []

    raw_dict = File.open(dictionary_file).read
    raw_dict.gsub!(/\r\n?/, "\n")
    raw_dict.each_line do |word|
      @dictionary_array << [word.map{|x| word_code(word.downcase)}.join.to_i, word.downcase]
    end
    @dictionary_array.sort!
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