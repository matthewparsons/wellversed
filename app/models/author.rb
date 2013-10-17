# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ActiveRecord::Base
  attr_accessible :name
  has_many :pieces
#  accepts_nested_attributes_for :pieces

  validates :name, presence: true, uniqueness: { case_sensitive: false }

#  def author
#  	@author = Author.new
#  end
end
