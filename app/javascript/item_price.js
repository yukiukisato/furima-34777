window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const priceContent = document.getElementById("add-tax-price","profit");
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = 0.1;
    Math.floor(priceInput.value * fee);
    addTaxDom.innerHTML = priceInput.value * fee
    const profitDom =document.getElementById("profit")
    Math.floor(priceInput.value - (priceInput.value * fee))
    profitDom.innerHTML = priceInput.value - (priceInput.value * fee)
  })
  

});