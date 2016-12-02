class Definition
  attr_reader(:text)

  def initialize(attributes)
    @text = attributes.fetch(:text)
  end
end
