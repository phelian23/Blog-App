module UsersHelper
  def user_img(user)
    user_avatars = []
    user_avatars << '/assets/user_img_1.webp'
    user_avatars << '/assets/user_img_2.webp'
    user_avatars << '/assets/user_img_3.png'
    user.photo.present? ? user.photo : user_avatars.sample
  end

  def num_of_post(user)
    user.posts_counter.present? ? user.posts_counter : 0
  end
end
