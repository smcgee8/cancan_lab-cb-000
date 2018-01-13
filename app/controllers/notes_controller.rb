class NotesController < ApplicationController

  load_and_authorize_resource

  def new
  end

  def create
    @note.viewers.create(user_id: current_user.id, note_id: @note.id)
    redirect_to '/'
  end

  def edit
  end

  def update
    redirect_to '/'
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
