# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Author do
	before do
		@author = Author.new(name: "Sample Author")
	end

	subject { @author }

	it { should respond_to(:name) }

end
