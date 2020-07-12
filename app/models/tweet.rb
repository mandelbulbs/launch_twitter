class Tweet < ApplicationRecord
	validates :content, length: { maximum: 4 }
end
