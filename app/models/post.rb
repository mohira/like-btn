class Post < ApplicationRecord
  belongs_to :user

  # 上の記述と同じ
  # belongs_to :user, class_name: :User, foreign_key: :user_id

  # このような書き方もできる(post.user_infoでアクセス)
  # belongs_to :user_info, class_name: :User, foreign_key: :user_id

  # 1の関係
  has_many :likes, dependent: :destroy

  # 2の関係
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :body,  presence: true
end
