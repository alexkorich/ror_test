class Converter

  attr_reader :dictionary_array
  attr_reader :dictionary_hash

  def initialize(dictionary_file)

    @dictionary_array = []
    @dictionary_hash = {}

    raw_dict = File.open(dictionary_file).read
    raw_dict.each_line do |word|
      word.gsub!("\n", '')

      @dictionary_array << [word.downcase.split("").map{|x| word_code(x)}.join.to_i, word.downcase]
    end
    @dictionary_array.sort!
    @dictionary_array.each_with_index.map do |el, i|
      next if i == 0
      if el[0] == @dictionary_array[i-1][0]
        el.concat @dictionary_array[i-1][1,2000]
        @dictionary_array[i-1][1] = nil
      end
    end
    @dictionary_array.reject! {|el| el[1] == nil }
    @dictionary_array.map!{|x| {x[0] => x[1,1000]}}
    @dictionary_array.each do |x|
      @dictionary_hash.merge!(x)
    end
  end

  def convert(ten_digits)
    res = []
    options = digits_options(ten_digits)
    options.each do |o|
      if o.to_s.length == 10
        res << @dictionary_hash[o]
      else
        inside_first = @dictionary_hash[o[0]]
        inside_second = @dictionary_hash[o[1]]
        if inside_first && inside_second
          if inside_first.any? && inside_second.any?
            inside_first.each do |f|
              inside_second.each do |s|
                res << [ f, s]
              end
            end
          end
        end
      end

    end
    res.compact
  end


  private

  def digits_options(num)
    # consider only pairs of word, no 555-blah-bla or foo-bar-bazz or he-23567-llo
    num = num.to_s.split("")
    puts num.class
    res = []
    res << num.join().to_i
    res << [num[0..2].join().to_i, num[3..9].join().to_i]
    res << [num[0..3].join().to_i, num[4..9].join().to_i]
    res << [num[0..4].join().to_i, num[5..9].join().to_i]
    res << [num[0..5].join().to_i, num[6..9].join().to_i]    #IMMA MASTER OF ALGORITHMS
    res
  end

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



converter = Converter.new('dictionary.txt')