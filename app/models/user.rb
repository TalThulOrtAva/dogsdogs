class User < ApplicationRecord
  has_many :dogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # take that, devise
  def valid_password?(password)
    if ::Rails.env == "development"
      true
    else
      super
    end
  end
end
