class Post < ApplicationRecord
    has_many :comments,  dependent: :destroy # when the post is destroyed, also its comments are destroyed
    validates :title, presence: true, length: {minimum: 5 }
    validates :content, presence: true
end
