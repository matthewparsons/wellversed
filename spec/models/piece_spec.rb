require 'spec_helper'

describe Piece do
	before do
		@piece = Piece.new(author: "Sample Author", title: "Sample Title", filename: "sample_filename.txt")
	end

	subject { @piece }

	it { should respond_to(:author) }
	it { should respond_to(:title) }
	it { should respond_to(:filename) }

end
