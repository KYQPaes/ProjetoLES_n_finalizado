const driver = require('../driver');
const { URL_SITE } = require('../settings');

// Checar se ele esta na tela inicial do sistema
// Procurar botao de Profile
// Checar se ele existe
// Clicar no botao
// Verificar se ta na tela de formulario
// Escrever no formuario login e senha
// clicar nobotao de entrar
// Verificar se ele entrou na tela inicial de um usuario loggado
describe('Testing edit card', () => {
  beforeAll(async () => {
    await driver;
    await driver.get("http://localhost:8080/deus-1.0-SNAPSHOT/home-page.xhtml");
  }, 10000);

//  afterAll(async () => {
//    await driver.quit();
//  }, 10000);


test('Checking Title', async () => {
  const title = await driver.getTitle();
  // title = 'Titulo da pagina'
  expect(title).toBe('Hotline Wallet');
  
})



test('Navegate to Login Page', async () => {
  const btn = await driver.findElement({ id: 'user' });

  const btnIsDisplayed = await btn.isDisplayed();
  expect(btnIsDisplayed).toBe(true);

  await btn.click();

  const title = await driver.getTitle();
  expect(title).toBe('Login');
  

})



test('Submit Correct Login', async () => {
  const inputEmail = await driver.findElement({ id: 'mail' });
  const inputPassword = await driver.findElement({ id: 'password' });
  const btn = await driver.findElement({ id: 'log' });

  const inputEmailDisplayed = await inputEmail.isDisplayed();
  expect(inputEmailDisplayed).toBe(true);

  await inputEmail.sendKeys("leonardo-eiji@live.com");
  

  const inputPasswordDisplayed = await inputPassword.isDisplayed();
  expect(inputPasswordDisplayed).toBe(true);

  await inputPassword.sendKeys("2036205");
  

  const btnIsDisplayed = await btn.isDisplayed();
  expect(btnIsDisplayed).toBe(true);

  await btn.click();
  

})

test('Checking Title', async () => {
  const title = await driver.getTitle();
  // title = 'Titulo da pagina'
  expect(title).toBe('Hotline Wallet');
  
})


test('Navegate to account settings', async () => {
  const btn = await driver.findElement({ id: 'account' });

  const btnIsDisplayed = await btn.isDisplayed();
  expect(btnIsDisplayed).toBe(true);

  await btn.click();

  const title = await driver.getTitle();
  expect(title).toBe('Clientes');
  

})

test('Navegate to edit card', async () => {
  const btn = await driver.findElement({ id: 'editcard' });

  const btnIsDisplayed = await btn.isDisplayed();
  expect(btnIsDisplayed).toBe(true);

  await btn.click();

  const title = await driver.getTitle();
  expect(title).toBe('Edicao de cartao');
  

})

 

  
  

  test('Register Card Letter on CVV', async () => {
    const inputcardnumber = await driver.findElement({ id: 'cardnumber' });
    const inputcardname = await driver.findElement({ id: 'cardname' });
    const inputvalidade = await driver.findElement({ id: 'validade' });
    const inputcvv = await driver.findElement({ id: 'cvv' });
    const inputcpf = await driver.findElement({ id: 'cpf' });
    
    const inputsave = await driver.findElement({ id: 'save' });


    await inputcardnumber.clear();
    await inputcardname.clear();
    await inputvalidade.clear();
    await inputcvv.clear();
    await inputcpf.clear();


    //Digitar numero do cartão
    const inputcardnumberDisplayed = await inputcardnumber.isDisplayed();
    expect(inputcardnumberDisplayed).toBe(true);

    await inputcardnumber.sendKeys("11111111");

    //Digitar nome do proprietario do cartão
    const inputcardnameDisplayed = await inputcardname.isDisplayed();
    expect(inputcardnameDisplayed).toBe(true);

    await inputcardname.sendKeys("leonardo eiji");

    //Digitar data da validade
    const inputvalidadeDisplayed = await inputvalidade.isDisplayed();
    expect(inputvalidadeDisplayed).toBe(true);

    await inputvalidade.sendKeys("5555");

    //Digitar CVV
    const inputcvvDisplayed = await inputcvv.isDisplayed();
    expect(inputcvvDisplayed).toBe(true);

    await inputcvv.sendKeys("leo");

    //Digitar cpf
    const inputcpfDisplayed = await inputcpf.isDisplayed();
    expect(inputcpfDisplayed).toBe(true);

    await inputcpf.sendKeys("654");

    

    //Salvar Cartão
    const inputsaveDisplayed = await inputsave.isDisplayed();
    expect(inputsaveDisplayed).toBe(true);

    await inputsave.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Somente numeros no campo de cvv"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup


    await inputcardnumber.clear();
    await inputcardname.clear();
    await inputvalidade.clear();
    await inputcvv.clear();
    await inputcpf.clear();
    

    
  })

  test('Register Card number on name', async () => {
    const inputcardnumber = await driver.findElement({ id: 'cardnumber' });
    const inputcardname = await driver.findElement({ id: 'cardname' });
    const inputvalidade = await driver.findElement({ id: 'validade' });
    const inputcvv = await driver.findElement({ id: 'cvv' });
    const inputcpf = await driver.findElement({ id: 'cpf' });
    
    const inputsave = await driver.findElement({ id: 'save' });


    //Digitar numero do cartão
    const inputcardnumberDisplayed = await inputcardnumber.isDisplayed();
    expect(inputcardnumberDisplayed).toBe(true);

    await inputcardnumber.sendKeys("1234567891234567");

    //Digitar nome do proprietario do cartão
    const inputcardnameDisplayed = await inputcardname.isDisplayed();
    expect(inputcardnameDisplayed).toBe(true);

    await inputcardname.sendKeys("456654");

    //Digitar data da validade
    const inputvalidadeDisplayed = await inputvalidade.isDisplayed();
    expect(inputvalidadeDisplayed).toBe(true);

    await inputvalidade.sendKeys("5555");

    //Digitar CVV
    const inputcvvDisplayed = await inputcvv.isDisplayed();
    expect(inputcvvDisplayed).toBe(true);

    await inputcvv.sendKeys("123");

    //Digitar cpf
    const inputcpfDisplayed = await inputcpf.isDisplayed();
    expect(inputcpfDisplayed).toBe(true);

    await inputcpf.sendKeys("45678912365");

    

    //Salvar Cartão
    const inputsaveDisplayed = await inputsave.isDisplayed();
    expect(inputsaveDisplayed).toBe(true);

    await inputsave.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Somente letras no campo de nome"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    await inputcardnumber.clear();
    await inputcardname.clear();
    await inputvalidade.clear();
    await inputcvv.clear();
    await inputcpf.clear();
    
    

    
  })

  


  

  test('Register Card Success', async () => {
    const inputcardnumber = await driver.findElement({ id: 'cardnumber' });
    const inputcardname = await driver.findElement({ id: 'cardname' });
    const inputvalidade = await driver.findElement({ id: 'validade' });
    const inputcvv = await driver.findElement({ id: 'cvv' });
    const inputcpf = await driver.findElement({ id: 'cpf' });
    
    const inputsave = await driver.findElement({ id: 'save' });


    await inputcardnumber.clear();
    await inputcardname.clear();
    await inputvalidade.clear();
    await inputcvv.clear();
    await inputcpf.clear();


    //Digitar numero do cartão
    const inputcardnumberDisplayed = await inputcardnumber.isDisplayed();
    expect(inputcardnumberDisplayed).toBe(true);

    await inputcardnumber.sendKeys("22222");

    //Digitar nome do proprietario do cartão
    const inputcardnameDisplayed = await inputcardname.isDisplayed();
    expect(inputcardnameDisplayed).toBe(true);

    await inputcardname.sendKeys("leonardo eiji");

    //Digitar data da validade
    const inputvalidadeDisplayed = await inputvalidade.isDisplayed();
    expect(inputvalidadeDisplayed).toBe(true);

    await inputvalidade.sendKeys("2017-05-12");

    //Digitar CVV
    const inputcvvDisplayed = await inputcvv.isDisplayed();
    expect(inputcvvDisplayed).toBe(true);

    await inputcvv.sendKeys("123");

    //Digitar cpf
    const inputcpfDisplayed = await inputcpf.isDisplayed();
    expect(inputcpfDisplayed).toBe(true);

    await inputcpf.sendKeys("6546545");

    

    //Salvar Cartão
    const inputsaveDisplayed = await inputsave.isDisplayed();
    expect(inputsaveDisplayed).toBe(true);

    await inputsave.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Cartao cadastrado com sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    
  })


  test('Test card Complete', async () => {
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp');
    
  })


  

  
  
    
})