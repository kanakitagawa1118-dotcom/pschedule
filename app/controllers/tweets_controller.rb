class TweetsController < ApplicationController

  before_action :authenticate_user!
    
  def index
    @tweets = Tweet.all
    @tags = Tag.all
    # 既存：タグ絞り込み
    if params[:tag_ids].present?
      @tweets = Tweet.joins(:tags)
                    .where(tags: { id: params[:tag_ids] })
    else
      @tweets = Tweet.all
    end

    # 既存：タグ作成
    if params[:tag].present?
      Tag.find_or_create_by(name: params[:tag])
    end

    # 🔽 ここから追加部分 🔽

    @latest_perfume = current_user.perfumes.last

    if @latest_perfume.present?
      recommended_tag = @latest_perfume.recommended_tag

      # ① 締切あり（優先）
      deadline_tasks = Tweet
                    .joins(:tags)
                    .where(tags: { name: recommended_tag })
                    .where.not(deadline: nil)
                    .order(deadline: :asc)

      # ② 締切なし
      no_deadline_tasks = Tweet
                        .joins(:tags)
                        .where(tags: { name: recommended_tag })
                        .where(deadline: nil)

      # ③ 合体（締切あり優先）
      @recommended_tweets =  (deadline_tasks + no_deadline_tasks).uniq.first(5)

    else
      @recommended_tweets = []
    end
  end

  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
  params.require(:tweet).permit(
    :title,
    :estimated_time,
    :memo,
    :image,
    :deadline,
    tag_ids: []
  )
end

end
