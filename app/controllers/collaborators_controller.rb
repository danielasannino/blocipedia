class CollaboratorsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator_user = User.find(params[:collaborator][:user_id])

    if @wiki.collaborators.exists?(user_id: @collaborator_user.id)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
      if @collaborator.save
        flash[:notice] = "#{@collaborator_user.email} was added as a collaborator."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:alert] = "There was an error adding this collaborator. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @collaborator_user = User.find(@collaborator.user_id)

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error removing this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
