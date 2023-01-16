class Tenant < ApplicationRecord
    validates :name, presence: true
    validates :age, numericality: { greater_than: 18 }

    has_many :leases
    has_many :apartments, through: :leases
end
