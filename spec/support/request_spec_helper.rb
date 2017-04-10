# spec/support/request_spec_helper
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def sort_by_creation(json_data)
    json_data.sort_by { |item| item["created_at"] }
  end
end
