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

    await driver.sleep(1500)

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Login');
    

  })


  test('Navegate to ADM Login Page', async () => {

    await driver.sleep(1500)
    
    await driver.get(`${URL_SITE}/loginAdm.jsp`);

    const title = await driver.getTitle();
    expect(title).toBe('Login Administrador');
    

  })

  


  test('Submit Correct Login', async () => {
    
    const inputLogin = await driver.findElement({ id: 'login' });
    const inputPassword = await driver.findElement({ id: 'senha' });
    const btn = await driver.findElement({ id: 'log' });

    const inputLoginDisplayed = await inputLogin.isDisplayed();
    expect(inputLoginDisplayed).toBe(true);

    await driver.sleep(1500)

    await inputLogin.sendKeys("admin");
    

    const inputPasswordDisplayed = await inputPassword.isDisplayed();
    expect(inputPasswordDisplayed).toBe(true);

    await driver.sleep(1500)

    await inputPassword.sendKeys("admin");
    

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();
    

  })

  test('Test is Logged', async () => {
    
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp');
    
     
  })


  test('Navegate to client account details', async () => {
    const btn = await driver.findElement({ id: 'view' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.click();
   


    /*const inputsearchDisplayed = await search.isDisplayed();
    expect(inputsearchDisplayed).toBe(true);

    await driver.sleep(1500)

    await search.sendKeys("21");

    await driver.sleep(1500)
  */

   




   /* await driver.get(`${URL_SITE}/adm.jsp?id=21`);
  

    const url = await driver.getCurrentUrl();

  
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/adm.jsp?id=21');

    */

  })
/*

  test('Change status from client order', async () => {
    const search = await driver.findElement({ id: 'myInput' });
    const btn = await driver.findElements({ id: 'status' });
    const save = await driver.findElements({ id: 'save' });
   


    const inputsearchDisplayed = await search.isDisplayed();
    expect(inputsearchDisplayed).toBe(true);

    await driver.sleep(1500)

    await search.sendKeys("104");



    const inputbtnDisplayed = await btn.isDisplayed();
    expect(inputbtnDisplayed).toBe(true);

    await driver.sleep(1500)

    await btn.sendKeys("PAGAMENTO REALIZADO");

    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await driver.sleep(1500)

    await save.click();



   
    

  })

  */
})