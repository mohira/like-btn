class Post < ApplicationRecord
  belongs_to :user

  # 上の記述と同じ
  # belongs_to :user, class_name: :User, foreign_key: :user_id

  # このような書き方もできる(post.user_infoでアクセス)
  # belongs_to :user_info, class_name: :User, foreign_key: :user_id
end
