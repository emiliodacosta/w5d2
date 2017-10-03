# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id

end
