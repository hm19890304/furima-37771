function calc (){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener("keyup", () => {
    tax.innerHTML = `${price.value * 0.1}`;
    profit.innerHTML = `${price.value * 0.9}`;
  });
};

window.addEventListener('load', calc);