class DisserDoc < ActiveRecord::Base
belongs_to :theme
has_attached_file :ddoc
has_ipaper_and_uses 'Paperclip'

validates_attachment_content_type :ddoc, :content_type => 'application/msword'
end

