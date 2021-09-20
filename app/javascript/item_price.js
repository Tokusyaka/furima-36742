window.addEventListener("load",()=>{

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
      console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      console.log(addTaxDom);

    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
      console.log(value_result)
    
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profitNumber);
  })
})

// const addTaxDom = document.getElementById("販売手数料を表示する場所のid");
// addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"  