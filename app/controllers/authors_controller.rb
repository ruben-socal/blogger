class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
	before_filter :zero_authors_or_authenticated, only: [:new, :create]
	before_filter :require_login, except: [:new, :create]
	
	def zero_authors_or_authenticated
		unless Author.count == 0 || current_user
			redirect_to root_path
			return false
		end
	end

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/1
  def show
  end	
	
  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_author
		@author = Author.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def author_params
		params.require(:author).permit(:username, :email, :password, :password_confirmation)
  end		
	
end
