class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # 過去1ヶ月
    perfumes = @user.perfumes
                    .where("created_at >= ?", 1.month.ago)
                    .order(created_at: :desc)

    # 日付ごとに最新1件だけ
    @results_by_date = perfumes
      .group_by { |p| p.created_at.to_date }
      .transform_values { |list| list.first }
  end
end
