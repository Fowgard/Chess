class Board
	attr_accessor :squares

	def initialize 
		init_squares()
		init_pieces()
	end

	def init_squares()
		@squares = Array.new(8){Array.new(8)}
		
		8.times do |i|
			8.times do |j|
				@squares[i][j] = Square.new(i,j)
			end
		end
	end

	def init_pieces()

	end

	def save
		File.open("save.dat","w") do |file|
			file.puts Marshal::dump(self)
		end
	end

	def self.load 
		Marshal::load(File.read("save.dat"))
	end
end

class Square
	attr_accessor :coordinates, :ocupant

	def initialize(x,y)
		@coordinates = [x,y]
	end
end