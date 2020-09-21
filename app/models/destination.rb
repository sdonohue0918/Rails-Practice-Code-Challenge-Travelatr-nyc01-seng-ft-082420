class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def posts_creation
        self.posts.map do |post|
            post.updated_at
        end
    end

    def recent_posts
        
        posts_creation.max(5) {|a , b| a <=> b}
            
            
    end

end
