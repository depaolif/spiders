class Spider < ActiveRecord::Base
    has_secure_password
    has_many :spider_interests
    has_many :interests, through: :spider_interests
    has_many :acquaintanceships
    has_many :acquaintances, through: :acquaintanceships
end
