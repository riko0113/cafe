// カートの中身を記憶する変数
let cart = {};
let currentTaxRate = 1.08;

// 税率切り替え関数
function switchTaxType(element, taxRate) {
    currentTaxRate = taxRate;
    
    // 1. 税率ボタンの見た目を切り替える
    document.querySelectorAll('.tax-type-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    element.classList.add('active');

    // 2. メニューに並んでいる商品の価格表示をすべて新税率で書き換える
    document.querySelectorAll('.product-price').forEach(priceSpan => {
        // HTMLに隠しておいた税抜価格を読み出す
        const rawPrice = Number(priceSpan.getAttribute('data-raw-price'));
        // 新しい税率で税込価格を計算（四捨五入）
        const newExcludingPrice = Math.round(rawPrice * currentTaxRate);
        // 画面の数値を書き換え
        priceSpan.innerText = newExcludingPrice;
    });

    // 3. カート（注文リスト）の計算もリフレッシュ
    renderCart();
}

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
    const excludingTaxPriceSpan = document.getElementById('excludingTaxPrice');
    const includingTaxPriceSpan = document.getElementById('includingTaxPrice');
    
    cartList.innerHTML = '';
    let totalExcludingTax = 0;

    const keys = Object.keys(cart);
    
    if (keys.length === 0) {
        cartList.innerHTML = '<p id="emptyMessage">商品が選択されていません</p>';
        excludingTaxPriceSpan.innerText = '0';
        includingTaxPriceSpan.innerText = '0';
        return;
    }

    keys.forEach(productId => {
        const item = cart[productId];
        const itemTotalExcludingTax = item.price * item.quantity;
        totalExcludingTax += itemTotalExcludingTax;

        const itemTotalIncludingTax = Math.round(itemTotalExcludingTax * currentTaxRate);

        const itemDiv = document.createElement('div');
        itemDiv.innerHTML = `
            <span>${item.name}</span>
            <button onclick="changeQuantity('${productId}', -1)">ー</button>
            <span> ${item.quantity} 個 </span>
            <button onclick="changeQuantity('${productId}', 1)">＋</button>
            <span>${itemTotalIncludingTax}円</span>
        `;
        cartList.appendChild(itemDiv);
    });

    let totalIncludingTax = Math.round(totalExcludingTax * currentTaxRate);

    excludingTaxPriceSpan.innerText = totalExcludingTax;
    includingTaxPriceSpan.innerText = totalIncludingTax;
}

function submitOrder() {
    if (Object.keys(cart).length === 0) {
        alert('カートが空です');
        return;
    }

    const totalExcluding = Number(document.getElementById('excludingTaxPrice').innerText);
    const totalIncluding = Number(document.getElementById('includingTaxPrice').innerText);
    
    const isTakeOutBoolean = (currentTaxRate === 1.08);

    const sendData = {
        items: cart,
        taxRate: currentTaxRate, 
        isTakeOut: isTakeOutBoolean,
        totalExcludingTax: totalExcluding,
        totalIncludingTax: totalIncluding
    };

    document.getElementById('cartDataInput').value = JSON.stringify(sendData);
    document.getElementById('hiddenOrderForm').submit();
}

window.onload = function() {
    const activeTab = document.querySelector('.tab.active');
    if (activeTab) {
        switchGenre(activeTab.getAttribute('data-genre-id'));
    }
};