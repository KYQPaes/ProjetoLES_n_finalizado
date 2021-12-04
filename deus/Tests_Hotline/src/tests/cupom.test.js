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


  test('Navegate to cupom page', async () => {
    const btn = await driver.findElement({ id: 'cupom' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Cupom');
    

  })


  test('add cupom in account', async () => {
    const btn = await driver.findElement({ id: 'inputcupom' });
    const btn2 = await driver.findElement({ id: 'cadastrar' });
    

    const btnDisplayed = await btn.isDisplayed();
    expect(btnDisplayed).toBe(true);

    await btn.sendKeys("FRETE-JBNTI");

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    await btn2.click();



    const title = await driver.getTitle();
    expect(title).toBe('Cupom');
    

  })


  

  
    
})