module PostsHelper
  def num_of_comment(post)
    post.comments_counter.present? ? post.comments_counter : 0
  end

  def num_of_likes(post)
    post.likes_counter.present? ? post.likes_counter : 0
  end
end
