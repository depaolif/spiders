class Acquaintanceship < ActiveRecord::Base
  belongs_to :spider
  belongs_to :acquaintance, class_name: "Spider"
end
