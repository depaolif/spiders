class Interest < ActiveRecord::Base
  has_many :spider_interests
  has_many :spiders, through: :spider_interests
end
