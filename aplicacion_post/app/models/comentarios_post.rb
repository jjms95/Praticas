class ComentariosPost < ApplicationRecord
 	belongs_to :post

	validates :contenido, presence: true, length: { minimum: 2 }
end
 