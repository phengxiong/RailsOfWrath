class User < ActiveRecord::Base
  # before_action :authenticate_user!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes, dependent: :destroy

  has_attached_file :avatar
  # , :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 # attr_accessible :avatar, :avatar_file_name, :avatar_content_file, :avatar_file_size

end
