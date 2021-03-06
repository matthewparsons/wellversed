# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  title      :string(255)
#  filename   :string(255)
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Piece do
	before do
		@piece = Piece.new(author_id: "1", title: "Sample Title", filename: "sample_filename.txt")
	end

	subject { @piece }

	it { should respond_to(:author_id) }
	it { should respond_to(:title) }
	it { should respond_to(:filename) }

end
