let cart = [];
let wishlist = [];

function addToCart(name, price) {
  const item = { name, price };
  cart.push(item);
  alert(`${name} added to cart!`);
  // Optionally redirect to order page:
  // window.location.href = "order.html";
}

  
function toggleWishlist(btn) {
  const productName = btn.parentElement.querySelector("p:nth-of-type(2)").innerText;
  
  const index = wishlist.indexOf(productName);
  if (index === -1) {
    wishlist.push(productName);
    btn.innerText = "♥ In Wishlist";
    btn.style.color = "red";
  } else {
    wishlist.splice(index, 1);
    btn.innerText = "♡ Wishlist";
    btn.style.color = "black";
  }
}
function addToCart(name, price) {
    const item = { name, price };
    const existingCart = JSON.parse(localStorage.getItem("cart")) || [];
    existingCart.push(item);
    localStorage.setItem("cart", JSON.stringify(existingCart));
    alert(`${name} added to cart!`);
  }
// In order.html
const urlParams = new URLSearchParams(window.location.search);
const item = urlParams.get('item');
const price = urlParams.get('price');

// Use these values to pre-fill your order form
document.getElementById('product-name').value = item;
document.getElementById('product-price').value = price;


let pack = [];
const MAX_PACK = 6;

function addToPack(flavor) {
  if (pack.length >= MAX_PACK) {
    alert("Pack is full!");
    return;
  }
  pack.push(flavor);
  updateUI();
}

function removeFromPack(index) {
  pack.splice(index, 1);
  updateUI();
}

function clearPack() {
  pack = [];
  updateUI();
}

function updateUI() {
  const needed = MAX_PACK - pack.length;
  document.getElementById("neededText").innerText = `${needed} needed for the 6 pack`;

  // Update icons
  const iconsDiv = document.getElementById("packIcons");
  iconsDiv.innerHTML = "";
  for (let i = 0; i < MAX_PACK; i++) {
    const span = document.createElement("span");
    if (i < pack.length) span.classList.add("filled");
    iconsDiv.appendChild(span);
  }

  // Update edit list
  const list = document.getElementById("packList");
  list.innerHTML = "";
  pack.forEach((item, index) => {
    const li = document.createElement("li");
    li.innerHTML = `${item} <span onclick="removeFromPack(${index})" style="cursor:pointer;color:#aa3c3c;">✕</span>`;
    list.appendChild(li);
  });

  // Toggle checkout button
  const btn = document.getElementById("addToCartBtn");
  btn.disabled = pack.length < MAX_PACK;
}

function toggleEdit() {
  document.getElementById("editPack").classList.toggle("hidden");
}

