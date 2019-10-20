module PostsHelper
  def post_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit' || action_name == 'update'
      post_path
    end
  end
end
