# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 作成するユーザー・メッセージの個数
user_count = 5
message_count = 5

ApplicationRecord.transaction do
  # テストユーザーが無ければ作成
  user_count.times do |n|
    User.find_or_create_by!(email: "test#{n + 1}@example.com") do |user|
      user.password = 'password'
    end
  end

  room = Room.create!(name: "test")
  user1 = User.find(1)
  user2 = User.find(2)
  RoomUser.create!(user: user1, room: room)
  RoomUser.create!(user: user2, room: room)


  # メッセージを全消去した上で，サンプルメッセージを作成。メッセージを作成したユーザーはランダムに決定する
  Message.destroy_all
  user_ids = User.ids
  message_list = []
  message_count.times do |n|
    user_id = user_ids.sample
    line_count = rand(1..4)
    # Fakerで１〜４行のランダムメッセージを作成
    content = Faker::Lorem.paragraphs(number: line_count).join("\n")
    message_list << { user_id: user_id, content: content, room: room}
  end
  Message.create!(message_list)
end
puts '初期データの追加が完了しました！'
