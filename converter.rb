class Converter

  def initialize(dictionary_file)
    @dictionary_hash = []

    raw_dict = File.open(dictionary_file).read
    raw_dict.gsub!(/\r\n?/, "\n")
    raw_dict.each_line do |word|
      word_code
    end  
  end

  def convert
    
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
        when j k l
        when m n o
        when p q r s
        when t u v
        when w x y z

    end
  end

end