class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumb: '100x100' }
  crop_attached_file :avatar
end
