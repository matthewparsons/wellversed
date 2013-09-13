# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  filename   :string(255)
#

require 'spec_helper'

describe Piece do
	before do
		@piece = Piece.new(title: "Poem" )
	end

	subject { @piece }

	it { should respond_to(:title) }
	it { should respond_to(:filename) }

end
