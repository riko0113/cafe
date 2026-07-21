// カートの中身を記憶する変数
let cart = {};
let currentTaxRate = 1.08;

// ストレージへ保存（sessionStorageを使用）
function saveToStorage() {
    sessionStorage.setItem('cafeCart', JSON.stringify(cart));
    sessionStorage.setItem('taxRate', currentTaxRate.toString());
}

// 税率切り替え関数
function switchTaxType(element, taxRate) {
    currentTaxRate = taxRate;
    
    // 1. 税率ボタンの見た目を切り替える（一旦すべて未選択にし、押されたものだけ黒くする）
    document.querySelectorAll('.tax-type-btn').forEach(btn => {
        btn.classList.remove('btn-dark');
        btn.classList.add('btn-outline-secondary');
    });
    element.classList.remove('btn-outline-secondary');
    element.classList.add('btn-dark');

    // 2. メニューに並んでいる商品の価格表示をすべて新税率で書き換える
    document.querySelectorAll('.product-price').forEach(priceSpan => {
        const rawPrice = Number(priceSpan.getAttribute('data-raw-price'));
        const newExcludingPrice = Math.round(rawPrice * currentTaxRate);
        priceSpan.innerText = newExcludingPrice;
    });
    
    // 3. カート（注文リスト）の計算もリフレッシュ＆保存
    renderCart();
}

// 【機能1】ジャンルの切り替え
function switchGenre(genreId) {
    document.querySelectorAll('.tab').forEach(tab => {
        tab.classList.remove('active');
    });
    
    const clickedTab = document.querySelector(`.tab[data-genre-id="${genreId}"]`);
    if (clickedTab) clickedTab.classList.add('active');

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
    const finalPrice = Math.round(price);

    if (cart[productId]) {
        cart[productId].quantity += 1;
    } else {
        cart[productId] = {
            name: productName,
            price: finalPrice,
            quantity: 1
        };
    }
    renderCart();
}

// 【機能3】「ー」「＋」ボタンを押したとき（数量変更）
function changeQuantity(productId, amount) {
    if (!cart[productId]) return;

    cart[productId].quantity += amount;

    if (cart[productId].quantity <= 0) {
        delete cart[productId];
    }
    renderCart();
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
        cartList.innerHTML = '<p id="emptyMessage" class="text-muted text-center m-0 small">商品が選択されていません</p>';
        excludingTaxPriceSpan.innerText = '0';
        includingTaxPriceSpan.innerText = '0';
        saveToStorage();
        return;
    }

    keys.forEach(productId => {
        const item = cart[productId];
        const itemTotalExcludingTax = item.price * item.quantity;
        totalExcludingTax += itemTotalExcludingTax;

        const itemTotalIncludingTax = Math.round(itemTotalExcludingTax * currentTaxRate);

        const itemDiv = document.createElement('div');
        itemDiv.className = 'd-flex align-items-center justify-content-between mb-2 p-2 border-bottom';
        itemDiv.innerHTML = `
            <span>${item.name}</span>
            <div class="d-flex align-items-center gap-2">
                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="changeQuantity('${productId}', -1)">ー</button>
                <span> ${item.quantity} 個 </span>
                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="changeQuantity('${productId}', 1)">＋</button>
                <span class="fw-bold ms-2">${itemTotalIncludingTax}円</span>
            </div>
        `;
        cartList.appendChild(itemDiv);
    });

    let totalIncludingTax = Math.round(totalExcludingTax * currentTaxRate);

    excludingTaxPriceSpan.innerText = totalExcludingTax;
    includingTaxPriceSpan.innerText = totalIncludingTax;

    saveToStorage();
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

// 画面読み込み時の復元処理（sessionStorage から読み出すように統一）
window.onload = function() {
    // 1. 税率の復元
    const savedTaxRate = sessionStorage.getItem('taxRate');
    if (savedTaxRate) {
        currentTaxRate = parseFloat(savedTaxRate);
    }

    // 現在の税率に合わせてボタンの見た目を初期化（黒塗り / 枠線）
    document.querySelectorAll('.tax-type-btn').forEach(btn => {
        const isTakeoutBtn = btn.innerText.includes('持ち帰り') && currentTaxRate === 1.08;
        const isEatInBtn = btn.innerText.includes('イートイン') && currentTaxRate === 1.10;

        if (isTakeoutBtn || isEatInBtn) {
            btn.classList.remove('btn-outline-secondary');
            btn.classList.add('btn-dark');
        } else {
            btn.classList.remove('btn-dark');
            btn.classList.add('btn-outline-secondary');
        }
    });

    // メニューの価格表示も選択中税率に合わせて初期表示
    document.querySelectorAll('.product-price').forEach(priceSpan => {
        const rawPrice = Number(priceSpan.getAttribute('data-raw-price'));
        const newExcludingPrice = Math.round(rawPrice * currentTaxRate);
        priceSpan.innerText = newExcludingPrice;
    });

    // 2. カートデータの復元
    const savedCart = sessionStorage.getItem('cafeCart');
    if (savedCart) {
        try {
            cart = JSON.parse(savedCart);
        } catch (e) {
            console.error('カートの読み込みに失敗しました', e);
            cart = {};
        }
    }

    // 3. カートのUIを描画
    renderCart();

    // 4. 最初（または現在アクティブ）のジャンルタブを開く
    const activeTab = document.querySelector('.tab.active') || document.querySelector('.tab');
    if (activeTab) {
        switchGenre(activeTab.getAttribute('data-genre-id'));
    }
};