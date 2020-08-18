class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tagging.where("tag_id = '#{params[:id]}'").each{ |tagging| tagging.destroy }
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path(Tag.all)
  end

end
