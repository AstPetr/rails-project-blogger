class AuthorSessionsController < ApplicationController
	def new
	end

    def create
	    if login(params[:email], params[:password])
	      redirect_back_or_to(articles_path, notice: 'Prisijungta sėkmingai.')
	    else
	      flash.now.alert = "Nepavyko prisijunkti."
	      render action: :new
	    end
	end

	def destroy
		logout
		redirect_to(:authors, notice: 'Atsijungta!')
	end

end
