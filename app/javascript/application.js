// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// ===== 診断ページ用 JS =====

document.addEventListener("turbo:load", () => {

  const cards = document.querySelectorAll(".question-card");
  const submit = document.querySelector(".submit-area");

  if(cards.length === 0) return; // 診断ページ以外では何もしない

    // 最初の質問を表示
  cards[0].classList.add("active");

  cards.forEach((card, index) => {

    const radios = card.querySelectorAll("input[type=radio]");

    radios.forEach(radio => {

      radio.addEventListener("change", () => {

        // 次の質問を表示
        const next = cards[index + 1];

        if(next){
          next.classList.add("active");
        }else if(submit){
          submit.classList.add("active");
        }

      });

    });

  });

});