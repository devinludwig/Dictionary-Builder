class Word
  attr_reader(:spelling, :definitions, :id)
  @@words = []

  def initialize(attributes)
    @spelling = attributes.fetch(:spelling)
    @definitions = []
    @id = @@words.length() + 1
  end

  def save
    @@words.push(self)
  end

  def save_definition(definition)
    @definitions.push(definition)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end

  define_singleton_method(:alphabetize) do
    @@words.sort_by!{|i| i.spelling()}
  end
end
