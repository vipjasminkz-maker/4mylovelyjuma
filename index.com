<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Моя Вселенная ✨</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: radial-gradient(ellipse at bottom, #0d1b2a 0%, #02040a 100%);
      font-family: 'Georgia', serif;
      overflow-x: hidden;
      color: #fff;
      padding: 20px;
    }

    /* Анимированный звездный фон */
    .stars-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
      pointer-events: none;
    }

    .star {
      position: absolute;
      background-color: #ffffff;
      border-radius: 50%;
      animation: twinkle linear infinite;
    }

    @keyframes twinkle {
      0%, 100% { opacity: 0.2; transform: scale(0.8); }
      50% { opacity: 1; transform: scale(1.3); }
    }

    /* Космическая туманность / Галактика */
    .nebula {
      position: fixed;
      width: 700px;
      height: 700px;
      background: radial-gradient(circle, rgba(112, 56, 160, 0.25) 0%, rgba(14, 116, 144, 0.18) 50%, transparent 70%);
      filter: blur(80px);
      border-radius: 50%;
      z-index: 1;
      animation: floatNebula 16s ease-in-out infinite alternate;
      pointer-events: none;
    }

    @keyframes floatNebula {
      0% { transform: translate(-15%, -15%) scale(1) rotate(0deg); }
      100% { transform: translate(15%, 15%) scale(1.15) rotate(10deg); }
    }

    /* Общие стили открыток */
    .card {
      position: relative;
      z-index: 10;
      width: 100%;
      max-width: 580px;
      padding: 40px 30px;
      background: rgba(13, 22, 41, 0.75);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      border-radius: 24px;
      border: 1px solid rgba(255, 215, 0, 0.35);
      box-shadow: 0 0 40px rgba(14, 116, 144, 0.25), inset 0 0 20px rgba(255, 255, 255, 0.03);
      text-align: center;
      transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    }

    /* Состояние скрытой карточки */
    .card.hidden {
      opacity: 0;
      transform: translateY(-20px) scale(0.95);
      pointer-events: none;
      position: absolute;
    }

    /* Вторая карточка до появления */
    .card.second-card-init {
      opacity: 0;
      transform: translateY(30px) scale(0.95);
      display: none;
    }

    /* Внутренняя золотистая декоративная рамка */
    .card::before {
      content: '';
      position: absolute;
      top: 14px;
      left: 14px;
      right: 14px;
      bottom: 14px;
      border: 1px solid rgba(255, 215, 0, 0.2);
      border-radius: 16px;
      pointer-events: none;
    }

    .space-icon {
      font-size: 38px;
      margin-bottom: 18px;
      display: inline-block;
      animation: pulse 3s infinite ease-in-out;
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); filter: drop-shadow(0 0 6px rgba(255, 215, 0, 0.6)); }
      50% { transform: scale(1.12); filter: drop-shadow(0 0 16px rgba(255, 215, 0, 0.9)); }
    }

    .letter-text {
      font-size: 1.08rem;
      line-height: 1.8;
      color: #f1f5f9;
      font-weight: 300;
      letter-spacing: 0.3px;
      margin-bottom: 25px;
      white-space: pre-line;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
    }

    .second-text {
      font-size: 1rem;
      line-height: 1.75;
      text-align: left;
      max-height: 60vh;
      overflow-y: auto;
      padding-right: 8px;
    }

    /* Кастомный красивый скроллбар для текста */
    .second-text::-webkit-scrollbar {
      width: 4px;
    }
    .second-text::-webkit-scrollbar-thumb {
      background: rgba(255, 215, 0, 0.3);
      border-radius: 4px;
    }

    .ps-text {
      font-style: italic;
      color: #fbbf24;
      margin-top: 15px;
      font-size: 0.95rem;
    }

    .heart-btn {
      background: linear-gradient(135deg, #e63946, #c1121f);
      color: #ffffff;
      border: none;
      padding: 14px 32px;
      font-size: 1.05rem;
      border-radius: 30px;
      cursor: pointer;
      box-shadow: 0 4px 20px rgba(230, 57, 70, 0.45);
      transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      font-family: inherit;
    }

    .heart-btn:hover {
      transform: translateY(-3px) scale(1.05);
      box-shadow: 0 8px 25px rgba(230, 57, 70, 0.65);
    }

    .heart-btn:active {
      transform: translateY(0) scale(0.98);
    }
  </style>
</head>
<body>

  <div class="nebula"></div>
  <div class="stars-container" id="stars"></div>

  <!-- Первое окно -->
  <div class="card" id="card1">
    <div class="space-icon">🌌</div>
    <div class="letter-text">
      Жаным, я очень сильно тебя люблю!

      Понимаю, со мной не легко, да и с тобой не всегда все так понятно... Но я думаю, мы — дополнение друг друга и всегда останемся им.

      Мне очень комфортно с тобой, и я дорожу временем, проведенным с тобой. В любой звонок я ощущаю себя как в укрытии от чужого и строгого мира.

      Будто бы нашла свою часть на этой планете — нашла свою вселенную, где мне хорошо, где я люблю и могу быть любимой. ✨
    </div>
    <button class="heart-btn" onclick="nextPage(event)">Отправить сердечки ❤️</button>
  </div>

  <!-- Второе окно -->
  <div class="card second-card-init" id="card2">
    <div class="space-icon">🪐</div>
    <div class="letter-text second-text">
      Любимый Жан, я тебя очень ценю и люблю, всегда буду с тобой рядом.

      Надеюсь, всю свою жизнь мы проведем вместе. Понимаю, сейчас не легко, но надеюсь, в будущем все будет гораздо лучше — я это знаю.

      Ты видишь и видел меня в разных состояниях и все равно оставался мне опорой и поддержкой. Слов не хватает, чтобы описать мою зависимую любовь к тебе.

      Спасибо, что остаешься надежным человеком и лучшим другом/подругой даже в отношениях — человеком, к которому я могу обратиться, даже если плохо, если хорошо и если мне одиноко.

      Я очень рада, что мы познакомились, и рада, что можем все обговаривать и принимать друг друга в любой ситуации, выслушивать и приходить к одному итогу — что мы любим друг друга и поддерживаем.

      Даже в мелкие моменты, как посмотреть фильм или поиграть вместе (особенно майн), я хочу плакать, ведь мой дорогой и самый любимый человек разделяет со мной такие милые и приятные моменты.

      С любовью, твоя принцесса )
      <div class="ps-text">P.S. Хорошего дня, моя злюка любимая, целую тебя, жаным! 💋</div>
    </div>
  </div>

  <script>
    // Генерация звезд
    const starsContainer = document.getElementById('stars');
    const starCount = 130;

    for (let i = 0; i < starCount; i++) {
      const star = document.createElement('div');
      star.classList.add('star');
      
      const size = Math.random() * 2.5 + 1;
      star.style.width = `${size}px`;
      star.style.height = `${size}px`;
      
      star.style.top = `${Math.random() * 100}%`;
      star.style.left = `${Math.random() * 100}%`;
      
      star.style.animationDuration = `${Math.random() * 3 + 2}s`;
      star.style.animationDelay = `${Math.random() * 3}s`;
      
      starsContainer.appendChild(star);
    }

    // Переход ко второй странице + эффекты
    function nextPage(event) {
      const btn = event.target;
      const rect = btn.getBoundingClientRect();
      
      // Анимация разлетающихся сердечек
      for (let i = 0; i < 20; i++) {
        const heart = document.createElement('span');
        heart.innerHTML = Math.random() > 0.3 ? '❤️' : '✨';
        heart.style.position = 'fixed';
        heart.style.left = `${rect.left + rect.width / 2}px`;
        heart.style.top = `${rect.top}px`;
        heart.style.fontSize = `${Math.random() * 18 + 16}px`;
        heart.style.pointerEvents = 'none';
        heart.style.zIndex = '100';
        heart.style.transition = 'all 1.4s cubic-bezier(0.25, 0.46, 0.45, 0.94)';
        
        document.body.appendChild(heart);

        const x = (Math.random() - 0.5) * 250;
        const y = -Math.random() * 180 - 60;

        setTimeout(() => {
          heart.style.transform = `translate(${x}px, ${y}px) scale(0)`;
          heart.style.opacity = '0';
        }, 20);

        setTimeout(() => {
          heart.remove();
        }, 1400);
      }

      // Переключение карточек
      const card1 = document.getElementById('card1');
      const card2 = document.getElementById('card2');

      card1.classList.add('hidden');

      setTimeout(() => {
        card1.style.display = 'none';
        card2.style.display = 'block';
        
        // Небольшая задержка перед проявлением второй карточки
        setTimeout(() => {
          card2.style.opacity = '1';
          card2.style.transform = 'translateY(0) scale(1)';
        }, 50);
      }, 700);
    }
  </script>
</body>
</html>
