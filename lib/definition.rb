class Definition
  attr_reader(:text, :part)

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @part = attributes.fetch(:part)
  end
end
