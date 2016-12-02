class Word
  attr_reader(:spelling, :definitions)
  @@words = []

  def initialize(attributes)
    @spelling = attributes.fetch(:spelling)
    @definitions = []
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


end
