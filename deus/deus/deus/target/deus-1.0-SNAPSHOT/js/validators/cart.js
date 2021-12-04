
function addCartItems(id, imagem, nome, preco, quant){
    alert ("Adicionado ao carrinho");
    var total = preco;
    let products = [];
    let cond = 0;
    
    if(localStorage.getItem('cart')){
        products = JSON.parse(localStorage.getItem('cart'));
        products.forEach(product => {
            if(product.id==id){
                product.quantidade = product.quantidade+1;
                cond = 1;
            }
        });
    }
    if (cond != 1){ 
        products.push({id: id, imagem:imagem, nome:nome,price:preco,quantidade:quant, total:total}); 
    }
    localStorage.setItem('cart', JSON.stringify(products));

    return true;
}

function getCartItems(){
    const container = document.getElementById("container");
    const total_preco = document.getElementById("total_preco");
    var id_prod="";
    if(localStorage.getItem("cart")){
        console.log(JSON.parse(localStorage.getItem("cart")));
        
        var arr = JSON.parse(localStorage.getItem('cart'));
        var cont = 0;
        var total_compra = 0.00;
        
        arr.forEach(function(obj) {
            var contquant = 0;
            id_prod += "/"+obj.id;
            while(contquant<obj.quantidade){
                total_compra += parseFloat(obj.total);
                contquant++;
            }
            container.insertAdjacentHTML('afterend', 
            '<tr><td><img src="'+obj.imagem+'" width="150" height="150"></td><td>Carteira '+obj.nome+''+obj.id+'</td><td>'+obj.total+'</td><td><a href="carrinho.jsp" onclick="return addCartQuant('+obj.id+')">+</a> '+obj.quantidade+' <a href="carrinho.jsp" onclick="return removeCartQuant('+obj.id+', '+cont+')">-</a><input type="hidden" id="quant" value="'+obj.quantidade+'"></td><td><a href="carrinho.jsp" onclick="return removeCartItem('+cont+')">remove</a></td></tr>');
            
            cont++;
        });
        total_preco.insertAdjacentHTML('afterbegin', '<input type="hidden" id="idprod" value="'+id_prod+'">R$'+total_compra);
        console.log(id_prod);
    }
    
}


function final_compra(){
    const container = document.getElementById("cont");
    const total_preco = document.getElementById("total_preco");
    const prod = document.getElementById("prod");
    const expresstotal = document.getElementById("total");
    
    
    let conta;
    
    var id_prod="";
    var quant_prod="";
    var total_compra = 0.00;
    if(localStorage.getItem("cart")){
        console.log(JSON.parse(localStorage.getItem("cart")));
        
        var arr = JSON.parse(localStorage.getItem('cart'));
        
        var total_compra = 0.00;
        
        arr.forEach(function(obj) {
            var contquant = 0;
            id_prod += "/"+obj.id;
            quant_prod += "/"+obj.quantidade;
            while(contquant<obj.quantidade){
                total_compra += parseFloat(obj.total);
                contquant++;
            }
            
            
            container.insertAdjacentHTML('afterend', 
            '<tr><td><img src="'+obj.imagem+'" width="50" height="50"></td><td>Carteira '+obj.nome+'</td><td>'+obj.total+'</td><td>'+obj.quantidade+'</td></tr>');
            
        });
        
        let frete = localStorage.getItem("frete");
        
        
        total_compra += parseFloat(frete);
        
        total_frete.insertAdjacentHTML('afterbegin', 'R$'+frete);
        total_preco.insertAdjacentHTML('afterbegin', 'R$'+total_compra);
        prod.insertAdjacentHTML('beforebegin',  '<input type="hidden" name="frete" value="'+frete+'"/>');
        prod.insertAdjacentHTML('beforebegin', '<input type="hidden" name="valor" value="'+total_compra+'"/><input type="hidden" name="idprod" value="'+id_prod+'"/><input type="hidden" name="quantprod" value="'+quant_prod+'"/>');
    }
}

function removeCartItem(itemIndex){
    var existingItems = JSON.parse(localStorage.getItem('cart'));
    existingItems.splice(itemIndex, 1);
    localStorage.setItem('cart', JSON.stringify(existingItems));
    return true;
}

function deleteAllItem(){
    window.localStorage.clear();
    return true;
}

function addCartQuant(id){
    if(localStorage.getItem('cart')){
        products = JSON.parse(localStorage.getItem('cart'));
        products.forEach(product => {
            if(product.id==id){
                product.quantidade = product.quantidade+1;
            }
        });
    }
    localStorage.setItem('cart', JSON.stringify(products));

}

function removeCartQuant(id, cont){
    var cond = 0;
    if(localStorage.getItem('cart')){
        products = JSON.parse(localStorage.getItem('cart'));
        products.forEach(product => {
            if(product.id==id){
                if(product.quantidade != 1){
                    product.quantidade = product.quantidade-1;
                }else{
                    cond = 1;
                }
            }
        });
    }
    localStorage.setItem('cart', JSON.stringify(products));
    if(cond == 1) removeCartItem(cont);
    return true;
}
