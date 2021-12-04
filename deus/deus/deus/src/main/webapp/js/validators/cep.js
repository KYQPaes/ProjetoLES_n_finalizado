function validate_cep(){
    let cep = document.getElementById("fret").value;
    
    let frete;
    let transporte;
    let data;
    
   
   
    
    today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //As January is 0.
    var yyyy = today.getFullYear();

    if(dd<10) dd='7'+dd;
    if(mm<10) mm='0'+mm;
    
        dd = dd + 7;
    
    
    if (mm == 1){
    
        if (dd > 30 ) {

          mm = 2;
          dd = dd - 30;
        }
    }
  
  
    if (mm == 2){
    
        if (dd > 28 ) {

          mm = 3;
          dd = dd - 28;
        }
    }
  
  
    if (mm == 3){
    
        if (dd > 31 ) {

          mm =4;
          dd = dd - 31;
        }
    }
  
    if (mm == 4){

        if (dd > 30 ) {

          mm =5;
          dd = dd - 30;
        }
    }

  
  if (mm == 5){
    
    if (dd > 31 ) {
      
      mm =6;
      dd = dd - 31;
    }
    
  }
  
  
  if (mm == 6){
    
    if (dd > 30 ) {
      
      mm =7;
      dd = dd - 30;
    }
    
  }
  
  
  if (mm == 7){
    
    if (dd > 31 ) {
      
      mm =8;
      dd = dd - 31;
    }
    
  }
  
  if (mm == 8){
    
    if (dd > 31 ) {
      
      mm =9;
      dd = dd - 31;
    }
    
  }
  
  if (mm == 9){
    
    if (dd > 30 ) {
      
      mm =10;
      dd = dd - 30;
    }
    
  }
  
  
  if (mm == 10){
    
    if (dd > 31 ) {
      
      mm =11;
      dd = dd - 31;
    }
    
  }
  
  if (mm == 11){
    
    if (dd > 30 ) {
      
      mm =12;
      dd = dd - 30;
    }
    
  }
  
  
  if (mm == 12){
    
    if (dd > 31 ) {
      
      mm =1;
      yyyy = yyyy+1
      dd = dd - 31;
    }
    
  }
  
 
  
    
    
    
  
  
  

    if (cep  < 20000000 ){
        
        alert("Fretes para essa regiao sao gratuitos");
        
        transporte = "Express";
        frete = 0;
        data = (dd+"/"+mm+"/"+yyyy);
 
       
        
      
    
    } else if (cep > 20000000){
        
        alert("Valor do frete para esta regiao 4,99");
        
        transporte = "Normal";
        frete = 4.99;
        data = (dd+"/"+mm+"/"+yyyy);
       
       
        
    } else if (cep === ""){
        alert("CEP invalido");
        
        
    
    }
     
     const expressPrice = document.getElementById("fretePrice");
     const expresstransporte = document.getElementById("transportadora");
     const expressdata = document.getElementById("entrega");
     
     const expressradio = document.getElementById("radio");
   
     
     
     const formattedExpressPrice = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(frete );
     expressPrice.innerHTML = formattedExpressPrice;
     
     expresstransporte.innerHTML = transporte;
     
     expressdata.innerHTML = data;
     
      
     
     const formattedExpressfrete = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(frete );
     
     
     expressradio.insertAdjacentHTML('afterbegin', 
            '<input type="radio" name="frete" value="'+frete+'" checked="checked"/>');
     
     
     
     
    localStorage.setItem('frete', frete);
    return frete;
    
}



    
    

