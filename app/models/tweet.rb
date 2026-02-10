class Tweet < ApplicationRecord
    belongs_to :user
    has_many :tweet_tag_relations, dependent: :destroy
    has_many :tags, through: :tweet_tag_relations, dependent: :destroy
    mount_uploader :image, ImageUploader

    def remaining_time_text
        return "期限なし" unless deadline.present?

        diff = (deadline - Time.current).to_i

        return "⚠️期限切れ" if diff <= 0

        days = diff / 1.day
        hours = (diff % 1.day) / 1.hour
        minutes = (diff % 1.hour) / 1.minute

        "⏰ あと #{days}日 #{hours}時間 #{minutes}分"
    end

    def start_now?
        return false unless deadline.present? && estimated_time.present?

        deadline <= Time.current + estimated_time.hours
    end


end

