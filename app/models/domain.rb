class Domain < ApplicationRecord
  belongs_to :project
  has_many :stories
end
