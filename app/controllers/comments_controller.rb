class CommentsController < ApplicationController

	before_filter :get_note

	def get_note
		@note = Note.find(params[:note_id])
	end

	def create
		@comment = @note.comments.build(params[:comment].merge!(user: current_user))
		
		if @comment.save
			redirect_to note_path(@note), notice: "Feedback added"
		else
			
			redirect_to note_path(@note), alert: "Feedback not added"
		end
	end

end
