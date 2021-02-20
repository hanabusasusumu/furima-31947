window.addEventListener('load', () => {
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("発火")
  });
});
