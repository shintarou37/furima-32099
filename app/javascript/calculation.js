window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById('add-tax-price');
  const fee = document.getElementById('profit');
  const total = addTaxDom.innerHTML = Math.floor( inputValue * 0.1 );
  fee.innerHTML = inputValue - total;
})
});