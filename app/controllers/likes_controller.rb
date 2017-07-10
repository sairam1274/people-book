class LikesController < ApplicationController
  include FindPolymorphic

  def create
    @likeable = find_polymorphic(params)
    @like = @likeable.likes.build(like_params)
    authorize @like
    @like.save
    flash[:success] = 'You liked it!'
    respond_to do |format|
      format.html { redirect_to request.referrer || root_path }
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    authorize @like
    @like.destroy
    flash[:success] = 'You dont\' like it anymore'
    respond_to do |format|
      format.html { redirect_to request.referrer || root_path }
      format.js
    end
  end

  private

  def like_params
    params.permit(:likeable_type, :likeable_id, :user_id)
  end
end