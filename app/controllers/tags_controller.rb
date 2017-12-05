class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tag_path(@tag)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
