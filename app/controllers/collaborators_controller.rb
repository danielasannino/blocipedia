class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.new(user_id: params[:collaborator][:user_id])

    if @collaborator.save
      redirect_to wiki_path(@wiki), notice: 'Collaborator was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find_by(wiki_id: @wiki.id, user_id: params[:id])
    if @collaborator.destroy
      redirect_to @wiki, notice: 'Collaborator was successfully destroyed.'
    else
      flash[:alert] = 'There was an error removing the collaborator'
      render :edit
    end
  end

  def new
    @collaborator = Collaborator.new
  end
end
