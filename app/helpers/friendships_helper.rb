module FriendshipsHelper
  def render_friendship(user)
    if current_user.sent_friend_requests.where(friend_id: user.id, accepted: false).any?
      render inline: content_tag(:div, 'Friend request sent', class: 'ui small blue button')
    elsif current_user.friend_with? user
      render 'friendships/unfriend', user: user
    else
      render 'friendships/add_friend', user: user
    end
  end
end