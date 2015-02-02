class Product < ActiveRecord::Base
  validates_presence_of :name, :description, :cost
  validates_format_of :name, :with => /\A^[a-zA-Z\s.]*$+\z/, message: 'cannot have numbers/special characters'
  validates_numericality_of :price, :weight, :cost
  has_many :reviews, :dependent => :destroy
end
