function calculation (){
  const item_price = document.getElementById("item-price")
  item_price.addEventListener("input", () => {
    const inputValue = item_price.value;
    const tax = Math.floor(inputValue / 10)
    const profit = Math.floor(inputValue - tax)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = profit
  });
};

window.addEventListener('load', calculation);