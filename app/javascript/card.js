const pay = () => {
  Payjp.setPublicKey("pk_test_63fabc6470cb3e58af9c8f21"); 

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shipping_address_purchase[number]"),
      cvc: formData.get("shipping_address_purchase[cvc]"),
      exp_month: formData.get("shipping_address_purchase[exp_month]"),
      exp_year: `20${formData.get("shipping_address_purchase[exp_year]")}`,
    };        



    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
   
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
   
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);