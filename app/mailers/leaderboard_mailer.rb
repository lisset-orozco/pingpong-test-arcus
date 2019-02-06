class LeaderboardMailer < ApplicationMailer
  def send_leaderboard
    @leader = params[:leader_list]
    user = params[:user]
    mail(to: user.email, subject: 'Current Leaderboard')
  end
end
