# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do |f|
  f += 1

  User.create(
    first_name: "player#{f}",
    last_name: "arcus#{f}",
    email: "player#{f}@gmail.com",
    password: '123456'
  )
  puts "#{f} usuarios creados" # if (f % 100).zero?
end

GameService.new(
  player_id: 1,
  opponent_id: 2,
  player_score: 9,
  opponent_score: 21,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 3,
  opponent_id: 4,
  player_score: 21,
  opponent_score: 19,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 5,
  opponent_id: 6,
  player_score: 24,
  opponent_score: 22,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 7,
  opponent_id: 8,
  player_score: 9,
  opponent_score: 21,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 1,
  opponent_id: 3,
  player_score: 21,
  opponent_score: 19,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 2,
  opponent_id: 4,
  player_score: 24,
  opponent_score: 22,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 5,
  opponent_id: 7,
  player_score: 9,
  opponent_score: 21,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object

GameService.new(
  player_id: 6,
  opponent_id: 8,
  player_score: 21,
  opponent_score: 19,
  played_at: "2018-11-11T19:31:04.431-06:00"
).create_object
