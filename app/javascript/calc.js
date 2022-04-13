function calc (){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener("keyup", () => {
    const floor_tax = Math.floor(price.value * 0.1);
    const floor_profit = Math.floor(price.value * 0.9);
    tax.innerHTML = floor_tax;
    profit.innerHTML = floor_profit;
  });
};

window.addEventListener('load', calc);