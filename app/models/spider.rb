class Spider < ActiveRecord::Base
    belongs_to :user
    has_many :spider_interests
    has_many :interests, through: :spider_interests
    has_many :acquaintanceships
    has_many :acquaintances, through: :acquaintanceships
end
