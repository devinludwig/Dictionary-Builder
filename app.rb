require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/new_word') do
  word = params.fetch('word')
  Word.new({:spelling => word}).save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word)
end

get('/word/:id/definition') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition)
end

post('/new_definition') do
  word_id = params.fetch('word_id')
  @word = Word.find(word_id.to_i())
  definition = params.fetch('definition')
  part = params.fetch('part')
  @word.save_definition(Definition.new({:text => definition, :part => part}))
  erb(:word)
end
