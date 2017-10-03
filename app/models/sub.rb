# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :string
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :moderator_id

  has_many :posts

end
