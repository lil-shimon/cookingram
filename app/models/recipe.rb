class Recipe < ApplicationRecord
    belongs_to :user
    attachment :image

    has_many :likes, dependent: :destroy
    has_many :users, through: :likes
    has_many :bookmarks, dependent: :destroy

    def bookmark_by?
      bookmarks.where(user_id: user.id).exists?
    end

    def liked_by?(user)
       likes.where(user_id: user.id).exists?
    end

    with_options presence: true do
        validates :title
        validates :body
        validates :image 
    end
    
end
