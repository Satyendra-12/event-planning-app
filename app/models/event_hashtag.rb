class EventHashtag < ApplicationRecord
    belongs_to :event
    belongs_to :hashtag
end
