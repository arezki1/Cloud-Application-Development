class Job < ApplicationRecord
  has_and_belongs_to_many :recruiters
  belongs_to :user
end
