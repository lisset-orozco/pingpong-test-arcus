require 'rails_helper'

RSpec.describe 'routes for Games', type: :routing do
  it { should route(:get, '/games').to(controller: 'games', action: :index) }
  it { should route(:get, '/games/1').to(controller: 'games', action: :show, id: '1') }
  it { should route(:post, '/games').to(controller: 'games', action: :create) }
  
  it { should route(:get, '/leaderboard').to(controller: 'games', action: :leaderboard) }
end
