class User < ApplicationRecord
  after_create :set_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :expenses

  def set_role
    update(role: 'user')
  end
end
