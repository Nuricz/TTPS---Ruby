class Office < ApplicationRecord
    has_many :employees

    scope :empty, -> { where(available: true) }

    def to_s
        "Nombre: " + name.to_s + "\n" +
        "Teléfono: " + phone_number.to_s + "\n" +
        "Dirección: " + address.to_s + "\n" +
        "Disponible: " + available.to_s + "\n"
    end
end
