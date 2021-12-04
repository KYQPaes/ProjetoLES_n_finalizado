function validate(){

    if (confirm('Por favor Confirme que deseja inativar o seu pedido')) {
      // Save it!
      alert ("Pedido Cancelado");
    } else {
      // Do nothing!

    }
}


function verify(){

    if (confirm('Alteracao do pedido so podem ocorrer antes do confirmacao do pagamento, Deseja Alterar seu pedido?')) {

        window.location.href ="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produ_alt.jsp" ; // Redirecting to other page.
        return true


    } else {
      // Do nothing!

    }
}


function admalt(){

  if (confirm('Tem certeza que deseja realizar essa alteracao?')) {
     
   
      alert ("Alteração Realizada");
    
  
  } else {
    // Do nothing!
    
  }
}


function alt(){
    var quant = document.getElementById("quant").value;
    
    if(quant<=0){
        alert("Por favor insira uma quantidade valida");
        return false;
    }
    window.location.href ="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp#" ; // Redirecting to other page.
    return true;
}

function altquanti(){
  var quant = document.getElementById("quant").value;
  var frete = document.getElementById("fret").value;
  
  
  if(frete === ""){
      alert("Por favor insira uma CEP valido");
      return false;
  }
  
  if(frete < 999999){
      alert("Por favor insira uma CEP valido");
      return false;
  }
  
  
  if(quant<=0){
      alert("Por favor insira uma quantidade valida");
      return false;
  }
  window.location.href ="http://localhost:8080/deus-1.0-SNAPSHOT/final-compra.jsp" ; // Redirecting to other page.
  return true;
}


function purchase(){
    
    
    if (confirm('Deseja Finalizar a compra?')) {
  // Save it!
  alert ("Compra Finalizada");
   
   return true;
  


}
}


function troca(){
    
   
  if (confirm('Realizar a requisicao de troca, exige que exista um cupom de troca em sua conta, voce tem certeza que deseja continuar?')) {
   let person = prompt("Entre com o cupom de troca");
   let text;
  alert ("Pedido de Troca Realizado");
} else {
  // Do nothing!
  
}
}

function validateCEP(){
    
    var frete = document.getElementById("fret").value
    
    if ( frete == "" ){
        alert ("Insira o CEP para calculo do frete");
        return false;
    }
    
   
    return true;
}



     
   
   




  


