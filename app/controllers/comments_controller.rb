class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @partition = Partition.find(params[:partition_id])
    # @member = Member.where(user: current_user, band: Band.where(user: current_user))
    @comment.partition = @partition
    @comment.member = Member.where(user: current_user).first
    if @comment.save
      redirect_to song_partition_path(@partition.song_id, @partition.id, anchor: "comment-#{@comment.id}")
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
