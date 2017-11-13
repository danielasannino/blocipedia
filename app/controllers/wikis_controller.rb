class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @collaborating_users = @wiki.users
    @users = User.all - @collaborating_users
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      redirect_to @wiki, notice: 'Wiki was successfully created.'
    else
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: 'Wiki was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    redirect_to wikis_url, notice: 'Wiki was successfully destroyed.'
  end

  private

    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end
