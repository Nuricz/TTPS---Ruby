class Employee < ApplicationRecord
    belongs_to :offices
    
    scope :vacant, -> { where(office_id: nil) }
    scope :occupied, -> { where!(office_id: nil) }
end
