window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
       
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = 0.1;
    addTaxDom.innerHTML = Math.floor(inputValue * fee)
    const profitDom =document.getElementById("profit")

    profitDom.innerHTML = Math.floor(inputValue - (inputValue * fee));
     
    
  })
  

});