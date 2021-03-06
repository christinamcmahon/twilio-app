# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'name', username: 'username', password_digest: 'password', avatar: 'avatar', bio: 'bio')
post = Post.create(title: 'title', date_time: 'date', content: 'content...', img: 'img', user_id: user.id, likes: 2)
comment = Comment.create(content: 'comment...', post_id: post.id, user_id: user.id)

puts "Seeded"