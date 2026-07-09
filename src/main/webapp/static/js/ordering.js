// カートの中身を記憶する変数
let cart = {};

// 【機能1】ジャンルの切り替え
function switchGenre(genreId) {
    // すべてのタブの赤文字（active）を解除
    document.querySelectorAll('.tab').forEach(tab => {
        tab.classList.remove('active');
    });
    
    // クリックされたジャンル文字を赤文字にする
    const clickedTab = document.querySelector(`.tab[data-genre-id="${genreId}"]`);
    if (clickedTab) clickedTab.classList.add('active');

    // ジャンルIDが一致する商品だけを表示する
    document.querySelectorAll('.product-card').forEach(card => {
        if (card.getAttribute('data-genre-id') === genreId) {
            card.classList.add('active');
        } else {
            card.classList.remove('active');
        }
    });
}

// 【機能2】商品ボタンを押したとき（カート追加）
function addToCart(productId, productName, price) {
    const finalPrice = Math.round(price); // 小数点以下を四捨五入

    if (cart[productId]) {
        cart[productId].quantity += 1; // 既にあったら個数を +1
    } else {
        cart[productId] = {            // 新しく追加
            name: productName,
            price: finalPrice,
            quantity: 1
        };
    }
    renderCart(); // 画面を更新
}

// 【機能3】「ー」「＋」ボタンを押したとき（数量変更）
function changeQuantity(productId, amount) {
    if (!cart[productId]) return;

    cart[productId].quantity += amount;

    // 個数が0個になったらリストから消す
    if (cart[productId].quantity <= 0) {
        delete cart[productId];
    }
    renderCart(); // 画面を更新
}

// 【機能4】注文リスト（カート）の見た目を最新にする
function renderCart() {
    const cartList = document.getElementById('cartList');
    const totalPriceSpan = document.getElementById('totalPrice');
    
    // 一度リストを空っぽにする
    cartList.innerHTML = '';
    let total = 0;

    const keys = Object.keys(cart);
    
    // 何もないときはメッセージを出して終了
    if (keys.length === 0) {
        cartList.innerHTML = '<p id="emptyMessage">商品が選択されていません</p>';
        totalPriceSpan.innerText = '0';
        return;
    }

    // カートに入っている商品分、文字とボタンを作る
    keys.forEach(productId => {
        const item = cart[productId];
        const itemTotalPrice = item.price * item.quantity;
        total += itemTotalPrice;

        const itemDiv = document.createElement('div');
        itemDiv.innerHTML = `
            <span>${item.name} (${item.price}円)</span>
            <button onclick="changeQuantity('${productId}', -1)">ー</button>
            <span> ${item.quantity} 個 </span>
            <button onclick="changeQuantity('${productId}', 1)">＋</button>
            <span>小計: ${itemTotalPrice}円</span>
        `;
        cartList.appendChild(itemDiv);
    });

    // 合計金額を書き換える
    totalPriceSpan.innerText = total;
}

// 確定ボタンを押したとき
function submitOrder() {
    if (Object.keys(cart).length === 0) {
        alert('カートが空です');
        return;
    }
    alert('注文を確定しました！');
    console.log(cart);
}

// 画面が開いた瞬間の初期動き（最初のジャンルを表示）
window.onload = function() {
    const activeTab = document.querySelector('.tab.active');
    if (activeTab) {
        switchGenre(activeTab.getAttribute('data-genre-id'));
    }
};