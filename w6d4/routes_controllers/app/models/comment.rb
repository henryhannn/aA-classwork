# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

    belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artwork_id

    has_many :likes, as: :likeable

end
