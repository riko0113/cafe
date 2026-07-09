let selectedMethod = "";
// 裏で保持しておくための税抜・税込の変数
let totalExcludingTax = 0;
let totalIncludingTax = 0;
let isTakeOutValue = true;

// 画面が開いた時の処理
window.onload = function() {
    const container = document.getElementById('paymentContainer');
    if (!container) return;

    const cartDataRaw = container.getAttribute('data-cart');
    
    if (cartDataRaw) {
        // 注文画面から届いた大きな塊（sendData）を解析
        const orderData = JSON.parse(cartDataRaw);
        
        // 塊の中から、商品リスト、税抜合計、税込合計をそれぞれバラして取得
        const cart = orderData.items;
        totalExcludingTax = orderData.totalExcludingTax; // 裏で保持！
        totalIncludingTax = orderData.totalIncludingTax; // 裏で保持！

        const paymentList = document.getElementById('paymentList');

        // カートの中身をループして画面に表示（表示は税込だけ！）
        Object.keys(cart).forEach(productId => {
            const item = cart[productId];
            // 注文画面で選ばれた税率（8% or 10%）を使って税込の小計を出す
            const itemTotalIncludingTax = Math.round((item.price * item.quantity) * orderData.taxRate);

            const p = document.createElement('p');
            p.innerText = `${item.name} × ${item.quantity}個 = ${itemTotalIncludingTax}円`;
            paymentList.appendChild(p);
        });

        // 💡 表示は税込合計だけ！（税抜合計は画面には出さず、上の変数でひっそり保持）
        const totalP = document.createElement('h3');
        totalP.innerText = `合計金額(税込): ${totalIncludingTax} 円`;
        paymentList.appendChild(totalP);
        
        isTakeOutValue = orderData.isTakeOut;
    } else {
        document.getElementById('paymentList').innerText = "注文情報がありません。";
    }
};

// 支払い方法ボタンが押されたとき
function selectPaymentMethod(element, methodName) {
    selectedMethod = methodName;
    
    document.querySelectorAll('.pay-method-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    element.classList.add('active');
    
    const cashInputArea = document.getElementById('cashInputArea');
    if (methodName === '現金') {
        cashInputArea.style.display = 'block';
    } else {
        cashInputArea.style.display = 'none';
        document.getElementById('cashAmount').value = '';
    }
}

//支払い確定ボタンが押されたとき
function executePayment() {
    if (selectedMethod === "") {
        alert("支払い方法を選択してください。");
        return;
    }

    let cashAmount = "";

    // 現金チェック
    if (selectedMethod === '現金') {
        cashAmount = document.getElementById('cashAmount').value;
        if (cashAmount === "" || Number(cashAmount) <= 0) {
            alert("お預かり金額を正しく入力してください。");
            return;
        }
        // お預かり金額が足りないチェック
        if (Number(cashAmount) < totalIncludingTax) {
            alert("お預かり金額が合計金額に満たないです。");
            return;
        }
    }

    // 次のサーブレットに送る隠しフォームの各inputにデータを詰め込む
    document.getElementById('paymentMethodInput').value = selectedMethod;
    document.getElementById('exTaxInput').value = totalExcludingTax; // 画面に出てない税抜
    document.getElementById('inTaxInput').value = totalIncludingTax; // 税込
    document.getElementById('cashAmountInput').value = cashAmount;   // 預かり金（現金以外なら空っぽ）
    document.getElementById('isTakeOutInput').value = isTakeOutValue;

    alert(`${selectedMethod}での支払いを確定し、売上を登録します。`);
    
    //フォームを一斉送信して、次の完了画面（サーブレット）へ遷移
    document.getElementById('finalPaymentForm').submit();
}