class AvtorefDoc < ActiveRecord::Base
belongs_to :theme
has_attached_file :adoc
has_ipaper_and_uses 'Paperclip'
end

