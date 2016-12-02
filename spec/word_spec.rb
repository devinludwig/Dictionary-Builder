require('rspec')
require('word')
require('definition')

describe('Word') do
  before() do
    Word.clear()
  end

  describe('#spelling') do
    it('returns the spelling of the word') do
      test_word = Word.new({:spelling => 'dictionary'})
      expect(test_word.spelling()).to(eq('dictionary'))
    end
  end

  describe('#save') do
    it('saves word to the @@words class variable') do
      test_word = Word.new({:spelling => 'dictionary'})
      expect(test_word.save()).to(eq([test_word]))
    end
  end

  describe('#save_definition') do
    it('saves an argument definition to the @definitions instance variable') do
      test_word = Word.new({:spelling => 'dictionary'})
      test_definition = Definition.new({:text => 'a list of words and their definitions'})
      expect(test_word.save_definition(test_definition)).to(eq([test_definition]))
    end
  end
end
