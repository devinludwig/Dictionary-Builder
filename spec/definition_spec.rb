require('rspec')
require('word')
require('definition')

describe('Definition') do

  describe('#text') do
    it('returns the text of the definition') do
      test_definition = Definition.new({:text => 'a list of words and their definitions'})
      expect(test_definition.text()).to(eq('a list of words and their definitions'))
    end
  end
end
