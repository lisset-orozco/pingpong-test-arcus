class LeaderboardMailer < ApplicationMailer
  def send_leaderboard(user, list)
    @leader = list
    mail(to: user.email, subject: 'Current Leaderboard')
  end
end
