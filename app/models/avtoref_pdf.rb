class AvtorefPdf < ActiveRecord::Base
belongs_to :theme
has_attached_file :apdf
has_ipaper_and_uses 'Paperclip'
end

