# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  firstname       :string(255)
#  surname         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  	attr_accessible :email, :firstname, :name, :surname, 
  					:password, :password_confirmation
  	has_secure_password
    has_many :studies, dependent: :destroy, source: :studied
    has_many :pieces, through: :studies

#  	before_save { |user| user.email = email.downcase }
    before_save { email.downcase! }
    before_save :create_remember_token

  	validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
	  validates :password_confirmation, presence: true
    after_validation { self.errors.messages.delete(:password_digest)}

    def studying?(piece)
      studies.find_by_piece_id(piece.id)
    end

    def study!(piece)
      studies.create(piece_id: piece.id)
    end

    def abandon!(study)
      studies.find_by_id(study.id).destroy
    end

    private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
      
end
