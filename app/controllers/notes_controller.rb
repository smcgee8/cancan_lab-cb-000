class NotesController < ApplicationController

  load_and_authorize_resource

  def new
  end

  def create
    Note.create(params[:note]) if current_user

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

end
