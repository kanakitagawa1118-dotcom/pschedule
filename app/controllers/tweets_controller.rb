class TweetsController < ApplicationController

  before_action :authenticate_user!
    
  def index
    @tweets = Tweet.all

    # 既存：タグ絞り込み
    if params[:tag_ids].present?
      tag_names = params[:tag_ids]
                    .select { |_, v| v == "1" }
                    .keys

      @tweets = Tweet.joins(:tags)
                    .where(tags: { name: tag_names })
                    .distinct
    end

    # 既存：タグ作成
    if params[:tag].present?
      Tag.find_or_create_by(name: params[:tag])
    end

    # 🔽 ここから追加部分 🔽

    @latest_perfume = current_user.perfumes.last

    if @latest_perfume.present?
      recommended_tag = @latest_perfume.recommended_tag

      @recommended_tweets = Tweet
                              .joins(:tags)
                              .where(tags: { name: recommended_tag })
                              .distinct
                              .limit(5)
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
    :mood_level,
    :estimated_time,
    :memo,
    :image,
    tag_ids: []
  )
end

end
