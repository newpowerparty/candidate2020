class Video < ApplicationRecord
  belongs_to :candidate, optional: true
  default_scope {order(position: :asc)}
  
  def video_meta
		@video ||= VideoInfo.new(url)
	end
	def video_key
		@video_key ||= video_meta.video_id
	end
	def title
		@title ||= video_meta.title
	end
	def image
		@image ||= video_meta.thumbnail_large
	end
end
