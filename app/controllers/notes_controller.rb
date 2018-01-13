class NotesController < ApplicationController

  load_and_authorize_resource

  def new
  end

  def create
    binding.pry
    Note.create(note_params) if current_user

  end

  def edit
  end

  def update
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
