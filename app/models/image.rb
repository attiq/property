class Image < ActiveRecord::Base
  belongs_to :property
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :size => (1..1.megabytes),
                 :resize_to => '400x270>',
                 :thumbnails => {:thumbnail=>'60x50>'}

  before_thumbnail_saved do |thumbnail|
    thumbnail.property_id = thumbnail.parent.property_id

  end
end
