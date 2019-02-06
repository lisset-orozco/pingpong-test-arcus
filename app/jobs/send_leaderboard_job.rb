class SendLeaderboardJob < ApplicationJob
  queue_as :default

  def perform
    leader_list = GameService.ranking_list
    leader_list.each { |user| LeaderboardMailer.with(user: user, leader_list: leader_list).send_leaderboard.deliver_now }
  end
end
