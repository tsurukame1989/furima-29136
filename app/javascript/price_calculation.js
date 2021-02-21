function priceCalculation() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  //手数料倍率10%を設定し、taxに代入
  const tax = 0.1;

  itemPrice.addEventListener("input", () => {
    // 価格フォームに入力した商品価格をinputPriceに代入
    const inputPrice = itemPrice.value;

    // inputPrice * taxの計算をして、小数点を切り捨てた値をtaxPriceに代入
    const taxPrice = Math.floor(inputPrice * tax);

    // "id:add-tax-price"の値を3桁毎に区切ってtaxPriceの値に置換
    addTaxPrice.innerHTML = taxPrice.toLocaleString();
    
    // "id:profit"の値を3桁毎に区切って(inputPrice - taxPrice)に置換
    profit.innerHTML = (inputPrice - taxPrice).toLocaleString();
  })
}

window.addEventListener('load', priceCalculation);