class AvtorefDoc < ActiveRecord::Base
belongs_to :theme
has_attached_file :adoc
has_ipaper_and_uses 'Paperclip'

validates_attachment_content_type :adoc, :content_type => 'application/msword'
end

