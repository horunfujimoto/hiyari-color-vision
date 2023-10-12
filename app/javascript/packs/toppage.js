// // application.jsに読み込みの記述を書く

// /* global $*/
// $(document).ready(function() {
//     // ページが読み込まれたら画面いっぱいに画像を表示するアニメーションを実行
//     $('body').css({
//         'overflow': 'hidden',
//         'margin': '0',
//         'padding': '0',
//     });

//     var $fullscreenImage = $('<div class="fullscreen-image"></div>').appendTo('body');
//     var $image = $('<img src="no_image.jpg" alt="Full Screen Image">').appendTo($fullscreenImage);

//     $fullscreenImage.css({
//         'width': '100%',
//         'height': '100%',
//         'position': 'absolute',
//         'top': 0,
//         'left': 0,
//         'z-index': 999
//     });

//     $image.css({
//         'object-fit': 'cover',
//         'width': '100%',
//         'height': '100%'
//     });

//     // 画像表示のアニメーションを完了後にトップページにリダイレクト
//     setTimeout(function() {
//         $fullscreenImage.fadeOut('slow', function() {
//             $fullscreenImage.remove();
//             $('body').css({
//                 'overflow': 'auto'
//             });
//             // トップページへのリダイレクト
//             window.location.href = '/'; // トップページへのURLを設定
//         });
//     }, 5000); // 画像を表示する時間（ミリ秒）を設定
// });
