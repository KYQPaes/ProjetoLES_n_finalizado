const driver = require('../driver');
const { URL_SITE } = require('../settings');

describe('Testing login in a account', () => {
  beforeAll(async () => {
    jest.setTimeout(60000);
    await driver;
    await driver.get(`${URL_SITE}/home-page.xhtml`);
  }, 10000);

 // afterAll(async () => {
  // await driver.quit();
  //}, 10000);
  

  test('Checking Title', async () => {
    const title = await driver.getTitle();
    // title = 'Titulo da pagina'
    expect(title).toBe('Hotline Wallet');
    
  })

  test('Navegate to Login Page', async () => {
    const btn = await driver.findElement({ id: 'user' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

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

    await driver.sleep(1500)

    await inputEmail.sendKeys("leonardo-eiji@live.com");
    

    const inputPasswordDisplayed = await inputPassword.isDisplayed();
    expect(inputPasswordDisplayed).toBe(true);

    await driver.sleep(1500)

    await inputPassword.sendKeys("2036205");
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();
    

  })

  test('Test is Logged', async () => {
    
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/home.jsp');
    
     
  })


  test('Navegate to order category', async () => {
    const btn = await driver.findElement({ id: 'personalizada' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Carteiras Hotline Wallet');
    

  })


  test('Navegate to product', async () => {
    const btn = await driver.findElement({ id: 'veja_mais' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Modelo Carteira');
    

  })



  test('add items to cart', async () => {
    const btn = await driver.findElement({ id: 'addcart' });
    
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();

    

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Adicionado ao carrinho"); //Print  await Alert popup

    await driver.sleep(1500)

    await alert.accept(); //Close Alert popup


    
    

  })


  test('Navegate to order category', async () => {
    const btn = await driver.findElement({ id: 'feminino' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Carteiras Hotline Wallet');
    

  })


  test('Navegate to product', async () => {
    const btn = await driver.findElement({ id: 'veja_mais' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Modelo Carteira');
    

  })


  test('add items to cart', async () => {
    const btn = await driver.findElement({ id: 'addcart' });
    
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();


    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Adicionado ao carrinho"); //Print  await Alert popup

    await driver.sleep(1500)
    
    await alert.accept(); //Close Alert popup


    
    

  })


  test('navegate to cart', async () => {
    const btn = await driver.findElement({ id: 'cart' });
    
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();


    const title = await driver.getTitle();
    expect(title).toBe('Carrinho');


    
    

  })


  

 

})