const driver = require('../driver');
const { URL_SITE } = require('../settings');

describe('Testing login in a account', () => {
  beforeAll(async () => {
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

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Login');
    

  })

  


  test('Submit Empty input', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputPassword = await driver.findElement({ id: 'password' });
    const btn = await driver.findElement({ id: 'log' });

    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    await inputEmail.sendKeys();

    const inputPasswordDisplayed = await inputPassword.isDisplayed();
    expect(inputPasswordDisplayed).toBe(true);

    await inputPassword.sendKeys();

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    
    await btn.click();
    

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Todos campos precisam ser preenchidos"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup



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

  test('Test is Logged', async () => {
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe(`${URL_SITE}/home.jsp`);
 
    
  })


})