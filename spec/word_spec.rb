require('rspec')
require('word')

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

end
