class Post < ApplicationRecord
	has_many :comentarios_posts
	validates :titulo, presence: true
	validates :titulo, length: { minimum: 3 }
	validates :cuerpo, presence: true
	validates :cuerpo, length: { minimum: 5 }
end
