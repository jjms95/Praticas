module ComentariosPostHelpers
	def visitar_comentario_post(p)
		visit "/posts"
		within "#post_#{p.id}" do
			click_link "Comentarios"
		end
	end	
end