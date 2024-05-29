class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  has_one_attached :cover_image
  has_rich_text :body

  validates_presence_of :title
end
