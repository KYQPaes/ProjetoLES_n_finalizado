const driver = require('../driver');
const { URL_SITE } = require('../settings');


describe('Testing purchase', () => {
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


  test('Navegate to order category', async () => {
    const btn = await driver.findElement({ id: 'personalizada' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Carteiras Personalizadas');
    

  })


  test('Navegate to product', async () => {
    const btn = await driver.findElement({ id: 'veja_mais' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Carteiras Personalizadas Rick e Morty');
    

  })


  test('insert cep number', async () => {
    const btn = await driver.findElement({ id: 'fret' });
    const btn2 = await driver.findElement({ id: 'calc' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.sendKeys("08615020");


    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    await btn2.click();


    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Fretes para essa regiao sao gratuitos"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup


    

  })


  test('add items to cart', async () => {
    const btn = await driver.findElement({ id: 'addcart' });
    const btn2 = await driver.findElement({ id: 'buy' });
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();


    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Adicionado ao carrinho"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup


    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    await btn2.click();

   
    expect(await alert.getText()).toBe("Adicionado ao carrinho"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup


    const final = await driver.findElement({ id: 'finalcompra' });

    const finalIsDisplayed = await final.isDisplayed();
    expect(finalIsDisplayed).toBe(true);

    await final.click();
    

  })


  test('insert cep number', async () => {
    const btn = await driver.findElement({ id: 'fret' });
    const btn2 = await driver.findElement({ id: 'calc' });
    const final = await driver.findElement({ id: 'finalcompra' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.sendKeys("08615020");


    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    await btn2.click();


    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Fretes para essa regiao sao gratuitos"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup


    const finalIsDisplayed = await final.isDisplayed();
    expect(finalIsDisplayed).toBe(true);

    await final.click();


    

  })


  


  
  
    
})