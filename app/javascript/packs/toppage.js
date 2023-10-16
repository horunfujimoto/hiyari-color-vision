// application.jsに読み込みの記述を書く
/* global $*/
$(function () { //アプリケーションの起動時一度だけ実行される
    var hasVisited = sessionStorage.getItem('hasVisited');

    if (!hasVisited) {
      // ページが読み込まれたら画面いっぱいに画像を表示するアニメーションを実行
      if ($('#top').length) { //topidの時は下記アクション実行
        $('body').css({
            'overflow': 'hidden',
            'margin': '0',
            'padding': '0',
        });

        const $fullscreenImage = $('<div class="fullscreen-image"></div>').appendTo('body');
        const $image = $('<img src="/assets/top.png" alt="Full Screen Image">').appendTo($fullscreenImage);

        $fullscreenImage.css({
            'width': '100%',
            'height': '100%',
            'position': 'absolute',
            'top': 0,
            'left': 0,
            'z-index': 999
        });

        $image.css({
            'object-fit': 'cover',
            'width': '100%',
            'height': '100%'
        });

        // 画像表示のアニメーションを完了後にトップページにリダイレクト
        setTimeout(function() {
            $fullscreenImage.fadeOut('slow', function() {
                $fullscreenImage.remove();
                $('body').css({
                    'overflow': 'auto'
                });

                $('.body').show(); //dispray:noneにした設定をここで表示
            });
        }, 1000); // 画像を表示する時間（1秒後）を設定
      }
    } else {
      $('.body').show(); //dispray:noneにした設定をここで表示
    }

    sessionStorage.setItem('hasVisited', 'true');
});
