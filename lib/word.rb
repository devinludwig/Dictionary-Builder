class Word
  attr_reader(:spelling, :definitions)
  @@words = []

  def initialize(attributes)
    @spelling = attributes.fetch(:spelling)
    @definitions = []
  end
