# == Schema Information
#
# Table name: pieces
#
#  id         :integer          not null, primary key
#  author_id  :string(255)
#  title      :string(255)
#  filename   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Piece < ActiveRecord::Base
  attr_accessible :author_id, :filename, :title
  belongs_to :author
  accepts_nested_attributes_for :author
  attr_accessible :author, :author_attributes

  def author_name
  	if !author.nil?
  		author.name
  	else
  		"Unknown"
  	end
  end

#  def author
#  	@author = Author.new
#  end

end
