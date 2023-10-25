document.addEventListener("DOMContentLoaded", function () {
  var something = document.getElementById("button-test");
  if (something) {
    something.style.cursor = "pointer";
    something.onclick = function () {};
  }
});
