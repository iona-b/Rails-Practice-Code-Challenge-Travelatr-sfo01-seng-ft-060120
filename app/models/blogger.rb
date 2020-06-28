class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence:true
    validates :age, numericality: {greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def number_of_likes
        likes = self.posts.sum {|post| post.likes.to_i}
    end
    
    def featured_post
        if self.posts.count > 0
            post = self.posts.max {|post| post.likes.to_i}
        else
            "new"
        end
    end

    def featured_post_title
        if self.posts.count > 0
            self.featured_post.title
        else
            "No posts yet! Click here to start your first post."
        end
    end

end
