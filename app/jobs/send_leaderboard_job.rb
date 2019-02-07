class SendLeaderboardJob < ApplicationJob
  queue_as :email_leaderboard

  def perform(user_id, list)
    user = User.find_by_id(user_id)
    LeaderboardMailer.send_leaderboard(user, list).deliver_later unless user.nil?
  end
end
