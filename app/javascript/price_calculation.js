function priceCalculation() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  //手数料倍率10%を設定し、taxに代入
  const tax = 0.1

  itemPrice.addEventListener("input", () => {
    // 価格フォームに入力した商品価格をinputPriceに代入
    const inputPrice = itemPrice.value;

    // inputPrice * taxの計算をして、小数点を切り捨てた値をtaxPriceに代入
    const taxPrice = Math.floor(inputPrice * tax);

    // "id:add-tax-price"の値をtaxPriceの値に置換
    addTaxPrice.innerHTML = taxPrice
    
    // "id:profit"の値を(inputPrice - taxPrice)に置換
    profit.innerHTML = (inputPrice - taxPrice)
  })
}

window.addEventListener('load', priceCalculation)