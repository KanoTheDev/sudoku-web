require 'sinatra'
require_relative './lib/sudoku'
require_relative './lib/cell'

get '/' do 
	@current_solution = puzzle(random_sudoku)
  erb :index
end

def unsolved_sudoku
	@unsolved_sudoku = random_sudoku

end

def random_sudoku
	seed = (1..9).to_a.shuffle + Array.new(81-9, 0)
	sudoku = Sudoku.new(seed.join)
	sudoku.solve!
	sudoku.to_s.chars
end

def puzzle(sudoku)
  sudoku.map! {|x| rand < 0.3 ? 0 : x} 
end