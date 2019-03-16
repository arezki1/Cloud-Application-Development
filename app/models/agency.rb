class Agency < ApplicationRecord
  has_many:recruiters, dependent: :destroy
end
