class Api::V1::QuotesController < ApplicationController
	#parado em => Ajustando as Rotas
	before_action :set_quote, only: [:show, :update, :destroy]
 
	#before_action :require_authorization!, only: [:show, :update, :destroy]
	before_action :require_authorization!, only: [:show, :update, :destroy]
	 
	 # GET /api/v1/contacts
	 
	def index
		#https://stackoverflow.com/questions/28888411/current-user-nil-after-successful-sign-in-while-using-mongoid-and-devise
		@quotes = current_user.quotes
		render json: @quotes

	end

# *****

	 
 # GET /api/v1/quotes/1
 
 def show
 
   render json: @quote
 
 end

# POST /api/v1/quotes
 
def create
	@quote = Quote.new(quote_params.merge(user: current_user))
	if @contact.save
		render json: @quote, status: :created
	else
	render json: @quote.errors, status: :unprocessable_entity
	end
end


 # PATCH/PUT /api/v1/contacts/1
def update
   if @quote.update(quote_params)
     render json: @quote
   else
     render json: @quote.errors, status: :unprocessable_entity
   end
end

# DELETE /api/v1/quotes/1
 
def destroy
	@quote.destroy
end

# *****

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_quote
	 		@quote = Quote.find(params[:id])
	 	end
	 
		# Only allow a trusted parameter "white list" through.
		def quote_params
			params.require(:quote).permit(:quote, :author, :author_about,:tags)
		end
	 
		def require_authorization!
			unless current_user == @quote.user
	 		render json: {}, status: :forbidden
	 	end
	end

end
