const driver = require('../driver');
const { URL_SITE } = require('../settings');


describe('Testing register card', () => {
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

test('Navegate to edit pass', async () => {
  const btn = await driver.findElement({ id: 'altpass' });

  const btnIsDisplayed = await btn.isDisplayed();
  expect(btnIsDisplayed).toBe(true);

  await btn.click();

  const title = await driver.getTitle();
  expect(title).toBe('Alterar senha');
  

})

  test('Change Password empty input', async () => {
    const inputold_pass = await driver.findElement({ id: 'old_pass' });
    const inputnew_pass = await driver.findElement({ id: 'new_pass' });
    const new_pass_confirm = await driver.findElement({ id: 'new_pass_confirm' });
    const btn = await driver.findElement({ id: 'alt' });

    //Inserir Senha Antiga
    const inputold_passDisplayed = await inputold_pass.isDisplayed();
    expect(inputold_passDisplayed).toBe(true);

    await inputold_pass.sendKeys("");

    //Inserir Senha nova
    const inputnew_passDisplayed = await inputnew_pass.isDisplayed();
    expect(inputnew_passDisplayed).toBe(true);

    await inputnew_pass.sendKeys("");

    //Confirmar Senha nova
    const new_pass_confirmDisplayed = await new_pass_confirm.isDisplayed();
    expect(new_pass_confirmDisplayed).toBe(true);

    await new_pass_confirm.sendKeys("");

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Campos Vazios"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

  })

  test('Change Password confirm incorrect', async () => {
    const inputold_pass = await driver.findElement({ id: 'old_pass' });
    const inputnew_pass = await driver.findElement({ id: 'new_pass' });
    const new_pass_confirm = await driver.findElement({ id: 'new_pass_confirm' });
    const btn = await driver.findElement({ id: 'alt' });

    //Inserir Senha Antiga
    const inputold_passDisplayed = await inputold_pass.isDisplayed();
    expect(inputold_passDisplayed).toBe(true);

    await inputold_pass.sendKeys("2036205");

    //Inserir Senha nova
    const inputnew_passDisplayed = await inputnew_pass.isDisplayed();
    expect(inputnew_passDisplayed).toBe(true);

    await inputnew_pass.sendKeys("4321");

    //Confirmar Senha nova
    const new_pass_confirmDisplayed = await new_pass_confirm.isDisplayed();
    expect(new_pass_confirmDisplayed).toBe(true);

    await new_pass_confirm.sendKeys("9999");

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Nova senha e sua confirmacao estao diferentes"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    await inputold_pass.clear();
    await inputnew_pass.clear();
    await new_pass_confirm.clear();
    

  })

  


  test('Change Password', async () => {
    const inputold_pass = await driver.findElement({ id: 'old_pass' });
    const inputnew_pass = await driver.findElement({ id: 'new_pass' });
    const new_pass_confirm = await driver.findElement({ id: 'new_pass_confirm' });
    const btn = await driver.findElement({ id: 'alt' });

    //Inserir Senha Antiga
    const inputold_passDisplayed = await inputold_pass.isDisplayed();
    expect(inputold_passDisplayed).toBe(true);

    await inputold_pass.sendKeys("2036205");

    //Inserir Senha nova
    const inputnew_passDisplayed = await inputnew_pass.isDisplayed();
    expect(inputnew_passDisplayed).toBe(true);

    await inputnew_pass.sendKeys("1234");

    //Confirmar Senha nova
    const new_pass_confirmDisplayed = await new_pass_confirm.isDisplayed();
    expect(new_pass_confirmDisplayed).toBe(true);

    await new_pass_confirm.sendKeys("1234");

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("senha alterada com sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

  })

  test('Test card Complete', async () => {
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp');
    
  })
  
  
    
})