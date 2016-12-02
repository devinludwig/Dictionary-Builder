require('rspec')
require('word')

describe('Word') do
  describe('#spelling') do
    it('returns the spelling of the word') do
      test_word = Word.new({:spelling => 'dictionary'})
      expect(test_word.spelling()).to(eq('dictionary'))
    end
  end
end
