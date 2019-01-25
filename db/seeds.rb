# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
8.times do |f|
  f += 1

  User.create(
    first_name: "player#{f}",
    last_name: "arcus#{f}",
    email: "player#{f}@gmail.com",
    password: '123456'
  )
  puts "#{f} users created"
end

# Games
rivals = [[1, 2], [3, 4], [5, 6], [7, 8], [1, 3], [2, 4], [5, 7], [6, 8]]
scores = [[9, 21], [21, 19], [24, 22], [9, 21],[21, 19], [24, 22], [9, 21], [21, 19]]

rivals.each_with_index do |r, i|
  s = scores[i]

  puts "player #{r.first} vs player #{r.second}"
    
  GameService.new(player_id: r.first,
                  opponent_id: r.second,
                  player_score: s.first,
                  opponent_score: s.second,
                  played_at: Time.now
  ).create_object
end
