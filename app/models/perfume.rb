class Perfume < ApplicationRecord
    belongs_to :user

    # Perfumeモデルに書くのがおすすめ
    def recommended_tag
        case question
        when "1111", "1112", "1121"
            "重い"
        when "1211", "1221"
            "普通"
        else
            "軽い"
        end
    end

end
