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
  
  def author_name
  	author.name
  end

end
