class DisserDoc < ActiveRecord::Base
belongs_to :theme
has_attached_file :ddoc
has_ipaper_and_uses 'Paperclip'
end

