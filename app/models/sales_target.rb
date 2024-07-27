class SalesTarget < ApplicationRecord
  belongs_to :product
  belongs_to :region
  belongs_to :store
end
