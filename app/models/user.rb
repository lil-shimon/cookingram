class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe

  attachment :profile_image

  has_many :recipes, dependent: :destroy

  validates :username, presence: true  

  def already_favorited?(recipe)
    self.likes.exists?(recipe_id: recipe.id) 
  end

end
