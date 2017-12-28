class HomeController < ApplicationController
	def index
		@posts = Post.most_recent
		@categories = Category.all
	end
	def busca
		@categoria_a_buscar = params[:category_id]
    	@categorias_buscadas = Post.where "category_id like ?","%#{@categoria_a_buscar}%"
	end
end
