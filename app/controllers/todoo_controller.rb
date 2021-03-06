class TodooController < ApplicationController
	#beore_action :authenticate_user!

	def index
		@todo_items = Todoo.all
		@todos  = Todoo.where(done: false)
		@todone = Todoo.where(done: true)
		
	end

	def new	
		@todo = Todoo.new
	end

	def create
		@todo = Todoo.new(todo_params)
		
		if @todo.save
			redirect_to todoo_index_path, :notice => "Your todo item was created!"
		else
			render "new" #When a new Item is created the page wont reload thanks to AJAX
		end

		 respond_to do |format|
     		 format.html
      	 	 format.js
    	 end
	end

	def show
	end

	def update
		@todo = Todoo.find(params[:id])
		
		
		if @todo.update_attribute(:done, true)
			redirect_to todoo_index_path, :notice => "Your todoo item has been marked as done"
		else
			redirect_to todoo_index_path, :notice => "Your todoo item could not be marked as done"
		end
	end

	def destroy
		@todo = Todoo.find(params[:id])
		@todo.destroy #Here instead of Destroy we will add a check mark by the item and cross the item off

		redirect_to todoo_index_path, :notice => "Todo item was deleted"
	end

	def completed
		if params[:completed] == 1
			params[:completed].each do |check|
				todo_id = check
				t = Todoo.find_by_id(todo_id)
				t.update_attribute(:completed, true)
				end
			end
		redirect_to todoo_index_path
	end

	private
	def todo_params
		params.require(:todoo).permit(:name, :done)
	end
end
