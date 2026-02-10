class Perfume < ApplicationRecord
    belongs_to :user

    # Perfumeモデルに書くのがおすすめ
    def recommended_tag
    case question
    when "1111", "1112", "1121", "1211", "2111"
        ["重い", "普通"]      # 元気がある日は重い・普通タスクも可
    when "1122", "1212", "1221", "2112", "2121", "2211"
        ["普通", "軽い"]      # 余裕少なめの時は普通・軽い
    when "1222", "2122", "2212", "2221", "2222"
        ["軽い"]             # ほぼ休息モード
    else
        ["普通"]
    end
    end

end
