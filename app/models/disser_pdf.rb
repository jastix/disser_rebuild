class DisserPdf < ActiveRecord::Base
belongs_to :theme
has_attached_file :dpdf
has_ipaper_and_uses 'Paperclip'

validates_attachment_content_type :dpdf, :content_type => 'application/pdf'
end

