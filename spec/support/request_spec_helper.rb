# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def sort_by_creation(video_product_list)
    video_product_list.sort_by { |vp| vp["created_at"] }
  end

  def sort_by_episode_number(episode_list)
    episode_list.sort_by { |episode| episode["episode_in_season"] }
  end

  def sort_by_time_left(video_product_list)
    video_product_list.sort_by { |vp| vp["expiration"] }
  end
end
