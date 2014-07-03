class TagsController < ApplicationController
	#Listing Articles by Tag
	def index
		@tags = Tag.all
	end
	
	def show
		@tag = Tag.find(params[:id])
	end	
	# destroy method added to delete tags
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		
		#flash.notice = "Tag '#{@tag.title}' Deleted!"
 
		redirect_to articles_path
	end	
end
