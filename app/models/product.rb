class Product < ActiveRecord::Base
  attr_accessible :Description, :image_url, :price, :title
  default_scope :order => 'title'
  validates :Description, :image_url, :price, :title, :presence => true
  validates :price, :numericality => {:greater_than_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
  	:with => %r{\.(gif|jpg|png)$}i,
  	:message => 'must be a URL for GIF,JPG or PNG image.'
}
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   has_attached_file :attach
end
