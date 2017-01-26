User.delete_all
Post.delete_all

3.times do |i|
  i += 1
  user = User.create(
    email: "user#{i}@example.com",
    password: 'password'
  )

  3.times do |j|
    j += 1
    Post.create(
      title: "#{user.email}の記事 その#{j}",
      body: "body#{j} by #{user.email}",
      user_id: user.id
    )
  end
end
