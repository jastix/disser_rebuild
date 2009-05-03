class DisserPdf < ActiveRecord::Base
belongs_to :theme
has_attached_file :dpdf
#has_ipaper_and_uses 'Paperclip'
end

