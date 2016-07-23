class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5 }
    validates :content, presence: true
end
