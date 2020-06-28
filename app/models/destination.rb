class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def featured_posts
        posts = self.posts.sort {|post| post.likes}
    end

    def average_age
        bloggers = self.posts.map {|post| post.blogger}
        age = bloggers.uniq.sum {|blogger| blogger.age}
        age/bloggers.count
    end

end
