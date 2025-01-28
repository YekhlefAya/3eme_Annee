const cart = [];
const totalPrice = document.getElementById("total-price");
const cartItems = document.getElementById("cart-items");
const productsContainer = document.querySelector(".products");
const btnAdd = document.getElementById("btnAdd");
const clearAll = document.getElementById("clearAll");
const clearCart = document.getElementById("clearCart");

var priceTotal = 0;

btnAdd.addEventListener("click", addProduct);

function addProduct() {
  const newProduct = document.getElementById("newProduct").value.trim();
  const price = parseFloat(document.getElementById("price").value);

  if (!newProduct || isNaN(price) || price <= 0) {
    alert("Please enter a valid product name and price.");
    return;
  }

  const productElement = document.createElement("div");
  productElement.classList.add("product");

  const titlePr = document.createElement("h2");
  titlePr.textContent = newProduct;

  const pricePr = document.createElement("p");
  pricePr.textContent = `Price: $${price.toFixed(2)}`;

  const btnPr = document.createElement("button");
  btnPr.textContent = "Add to Cart";
  btnPr.classList.add("add-to-cart");
  btnPr.addEventListener("click", () => {
    addToCart(newProduct, price);
  });

  productElement.appendChild(titlePr);
  productElement.appendChild(pricePr);
  productElement.appendChild(btnPr);
  productsContainer.appendChild(productElement);

  document.getElementById("newProduct").value = "";
  document.getElementById("price").value = "";
}

document.querySelectorAll(".add-to-cart").forEach((btn2) => {
  btn2.addEventListener("click", () => {
    let btn3 = btn2.parentElement;
    let produitName = btn3.querySelector("h2").innerHTML;
    let produitPrice = btn3
      .querySelector("p")
      .innerHTML.replace("Price: $", "");
    addToCart(produitName, parseFloat(produitPrice));
  });
});

function addToCart(produitName, produitPrice) {
  cart.push({ produitName, produitPrice });
  // console.log(cart);

  let produitItem = document.createElement("li");
  produitItem.textContent = `${produitName} - ${produitPrice} x1`;
  cartItems.appendChild(produitItem);

  priceTotal += produitPrice;
  // console.log(produitPrice);
  totalPrice.innerText = `Total $ ${priceTotal}`;
}

clearAll.addEventListener("click", () => {
  productsContainer.innerHTML = "";
});

clearCart.addEventListener("click", () => {
  cartItems.innerHTML = "";
  totalPrice.innerHTML = "Total: $0";
});
