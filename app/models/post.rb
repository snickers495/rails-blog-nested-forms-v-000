class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |tag_attributes| tag_attributes['name'].blank? }

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |tags_attributes|
      tag = Tag.find_or_create_by(tags_attributes)
      self.tags << tag
    end
  end
end
