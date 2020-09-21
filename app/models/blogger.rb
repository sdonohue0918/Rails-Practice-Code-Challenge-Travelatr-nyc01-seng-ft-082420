class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}


    def increment_like
        self.posts.select {|post| post.likes}.map {|post| post.likes += 1}
    
    end

end
