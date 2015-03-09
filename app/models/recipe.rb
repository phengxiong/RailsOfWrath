class Recipe < ActiveRecord::Base

  before_save :to_youtube_id

  paginates_per 12
  has_many :recipe_comments, dependent: :destroy
  validates_presence_of :title, :serving_size, :directions, :category, :ingredients, :cook_time, :prepare_time

  validates_format_of :youtube, :with=> /https?:\/\/(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?/

  private
  def to_youtube_id
    if ! self.youtube.blank?
      self.youtube = YouTubeAddy.extract_video_id(self.youtube)
    end
  end

end
