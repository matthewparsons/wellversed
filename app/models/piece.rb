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
#

class Piece < ActiveRecord::Base
  attr_accessible :author, :content, :title
end
