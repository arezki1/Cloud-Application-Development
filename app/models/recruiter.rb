class Recruiter < ApplicationRecord
  belongs_to :agency
  has_and_belongs_to_many :jobs
end
