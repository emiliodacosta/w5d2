# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :post_id, :sub_id, presence: true
  validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :post

  belongs_to :sub

end
