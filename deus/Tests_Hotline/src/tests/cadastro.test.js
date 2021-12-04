const driver = require('../driver');
const { URL_SITE } = require('../settings');

describe('Testing Account Sign', () => {
  beforeAll(async () => {
    await driver;
    await driver.get(`${URL_SITE}/cadastro.xhtml`);
  }, 10000);

//  afterAll(async () => {
//    await driver.quit();
//  }, 10000);

  test('Checking Title', async () => {
    const title = await driver.getTitle();
    // title = 'Titulo da pagina'
    expect(title).toBe('Cadastro');
    
  })

  test('Sign Diferent Email', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputConfirmEmail = await driver.findElement({ id: 'mail_confirmation' });
    const inputName = await driver.findElement({ id: 'name' });
    const inputSurName = await driver.findElement({ id: 'surname' });
    const inputPass = await driver.findElement({ id: 'pass' });
    const inputConfirmPass = await driver.findElement({ id: 'pass_confirmation' });
    const inputBox = await driver.findElement({ id: 'box' });
    const inputConfirm = await driver.findElement({ id: 'confirmar' });

    //Digitar Email
    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    
    await inputEmail.sendKeys("leonardo@teste.com");

    //Confirmar Email
    const inputConfirmEmailDisplayed = await inputConfirmEmail.isDisplayed();
    expect(inputConfirmEmailDisplayed).toBe(true);

    
    await inputConfirmEmail.sendKeys("emailDiferente");

    //Digitar Nome
    const inputNameDisplayed = await inputName.isDisplayed();
    expect(inputNameDisplayed).toBe(true);

    
    await inputName.sendKeys("leonardo");

    //Digitar Sobrenome
    const inputSurNameDisplayed = await inputSurName.isDisplayed();
    expect(inputSurNameDisplayed).toBe(true);

    
    await inputSurName.sendKeys("Eiji");

    //Digitar Senha
    const inputPassDisplayed = await inputPass.isDisplayed();
    expect(inputPassDisplayed).toBe(true);

    
    await inputPass.sendKeys("12345");

    //Confirmar Senha
    const inputConfirmPassDisplayed = await inputConfirmPass.isDisplayed();
    expect(inputConfirmPassDisplayed).toBe(true);

    
    await inputConfirmPass.sendKeys("12345");

    //Check Termos
    const inputBoxDisplayed = await inputBox.isDisplayed();
    expect(inputBoxDisplayed).toBe(true);

    
    await inputBox.click();
    

    //cadastrar
    const inputConfirmDisplayed = await inputConfirm.isDisplayed();
    expect(inputConfirmDisplayed).toBe(true);

    
    await inputConfirm.click();
    

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Emails diferentes"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    
    await inputEmail.clear();
    await inputConfirmEmail.clear();
    await inputName.clear();
    await inputSurName.clear();
    await inputPass.clear(); 
    await inputConfirmPass.clear();

    await inputBox.click();
         
  

             
  })
  

  test('Sign Diferent Password', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputConfirmEmail = await driver.findElement({ id: 'mail_confirmation' });
    const inputName = await driver.findElement({ id: 'name' });
    const inputSurName = await driver.findElement({ id: 'surname' });
    const inputPass = await driver.findElement({ id: 'pass' });
    const inputConfirmPass = await driver.findElement({ id: 'pass_confirmation' });
    const inputBox = await driver.findElement({ id: 'box' });
    const inputConfirm = await driver.findElement({ id: 'confirmar' });

    //Digitar Email
    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    
    await inputEmail.sendKeys("leonardo@teste.com");

    //Confirmar Email
    const inputConfirmEmailDisplayed = await inputConfirmEmail.isDisplayed();
    expect(inputConfirmEmailDisplayed).toBe(true);

    
    await inputConfirmEmail.sendKeys("leonardo@teste.com");

    //Digitar Nome
    const inputNameDisplayed = await inputName.isDisplayed();
    expect(inputNameDisplayed).toBe(true);

    
    await inputName.sendKeys("leonardo");

    //Digitar Sobrenome
    const inputSurNameDisplayed = await inputSurName.isDisplayed();
    expect(inputSurNameDisplayed).toBe(true);

    
    await inputSurName.sendKeys("Eiji");

    //Digitar Senha
    const inputPassDisplayed = await inputPass.isDisplayed();
    expect(inputPassDisplayed).toBe(true);

    
    await inputPass.sendKeys("12345");

    //Confirmar Senha
    const inputConfirmPassDisplayed = await inputConfirmPass.isDisplayed();
    expect(inputConfirmPassDisplayed).toBe(true);

    
    await inputConfirmPass.sendKeys("1");

    //Check Termos
    const inputBoxDisplayed = await inputBox.isDisplayed();
    expect(inputBoxDisplayed).toBe(true);

    await inputBox.click();
    

    //Cadastrar
    const inputConfirmDisplayed = await inputConfirm.isDisplayed();
    expect(inputConfirmDisplayed).toBe(true);

    
    await inputConfirm.click();
    

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Senha diferentes"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    await inputEmail.clear();
    await inputConfirmEmail.clear();
    await inputName.clear();
    await inputSurName.clear();
    await inputPass.clear(); 
    await inputConfirmPass.clear();
    await inputBox.click();
    
          
  })

  test('Sign Dont Accept Terms', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputConfirmEmail = await driver.findElement({ id: 'mail_confirmation' });
    const inputName = await driver.findElement({ id: 'name' });
    const inputSurName = await driver.findElement({ id: 'surname' });
    const inputPass = await driver.findElement({ id: 'pass' });
    const inputConfirmPass = await driver.findElement({ id: 'pass_confirmation' });
    const inputBox = await driver.findElement({ id: 'box' });
    const inputConfirm = await driver.findElement({ id: 'confirmar' });

    //Digitar Email
    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    await inputEmail.sendKeys("leonardo@teste.com");

    //Confirmar Email
    const inputConfirmEmailDisplayed = await inputConfirmEmail.isDisplayed();
    expect(inputConfirmEmailDisplayed).toBe(true);

    await inputConfirmEmail.sendKeys("leonardo@teste.com");

    //Digitar Nome
    const inputNameDisplayed = await inputName.isDisplayed();
    expect(inputNameDisplayed).toBe(true);

    await inputName.sendKeys("leonardo");

    //Digitar Sobrenome
    const inputSurNameDisplayed = await inputSurName.isDisplayed();
    expect(inputSurNameDisplayed).toBe(true);

    await inputSurName.sendKeys("Eiji");

    //Digitar Senha
    const inputPassDisplayed = await inputPass.isDisplayed();
    expect(inputPassDisplayed).toBe(true);

    await inputPass.sendKeys("12345");

    //Confirmar Senha
    const inputConfirmPassDisplayed = await inputConfirmPass.isDisplayed();
    expect(inputConfirmPassDisplayed).toBe(true);

    await inputConfirmPass.sendKeys("12345");

    

    //Cadastrar
    const inputConfirmDisplayed = await inputConfirm.isDisplayed();
    expect(inputConfirmDisplayed).toBe(true);

    await inputConfirm.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Precisa aceitar os termos de uso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    await inputEmail.clear();
    await inputConfirmEmail.clear();
    await inputName.clear();
    await inputSurName.clear();
    await inputPass.clear(); 
    await inputConfirmPass.clear();
    
    
          
  })

  test('Sign empty input', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputConfirmEmail = await driver.findElement({ id: 'mail_confirmation' });
    const inputName = await driver.findElement({ id: 'name' });
    const inputSurName = await driver.findElement({ id: 'surname' });
    const inputPass = await driver.findElement({ id: 'pass' });
    const inputConfirmPass = await driver.findElement({ id: 'pass_confirmation' });
    const inputBox = await driver.findElement({ id: 'box' });
    const inputConfirm = await driver.findElement({ id: 'confirmar' });

    //Digitar Email
    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    await inputEmail.sendKeys("");

    //Confirmar Email
    const inputConfirmEmailDisplayed = await inputConfirmEmail.isDisplayed();
    expect(inputConfirmEmailDisplayed).toBe(true);

    await inputConfirmEmail.sendKeys("");

    //Digitar Nome
    const inputNameDisplayed = await inputName.isDisplayed();
    expect(inputNameDisplayed).toBe(true);

    await inputName.sendKeys("");

    //Digitar Sobrenome
    const inputSurNameDisplayed = await inputSurName.isDisplayed();
    expect(inputSurNameDisplayed).toBe(true);

    await inputSurName.sendKeys("");

    //Digitar Senha
    const inputPassDisplayed = await inputPass.isDisplayed();
    expect(inputPassDisplayed).toBe(true);

    await inputPass.sendKeys("");

    //Confirmar Senha
    const inputConfirmPassDisplayed = await inputConfirmPass.isDisplayed();
    expect(inputConfirmPassDisplayed).toBe(true);

    await inputConfirmPass.sendKeys("");

    

    //Cadastrar
    const inputConfirmDisplayed = await inputConfirm.isDisplayed();
    expect(inputConfirmDisplayed).toBe(true);

    await inputConfirm.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Campos Vazios"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

    
          
  })

  test('Sign in successful', async () => {
    const inputEmail = await driver.findElement({ id: 'mail' });
    const inputConfirmEmail = await driver.findElement({ id: 'mail_confirmation' });
    const inputName = await driver.findElement({ id: 'name' });
    const inputSurName = await driver.findElement({ id: 'surname' });
    const inputPass = await driver.findElement({ id: 'pass' });
    const inputConfirmPass = await driver.findElement({ id: 'pass_confirmation' });
    const inputBox = await driver.findElement({ id: 'box' });
    const inputConfirm = await driver.findElement({ id: 'confirmar' });

    //Digitar Email
    const inputEmailDisplayed = await inputEmail.isDisplayed();
    expect(inputEmailDisplayed).toBe(true);

    await inputEmail.sendKeys("leonardo@teste.com");

    //Confirmar Email
    const inputConfirmEmailDisplayed = await inputConfirmEmail.isDisplayed();
    expect(inputConfirmEmailDisplayed).toBe(true);

    await inputConfirmEmail.sendKeys("leonardo@teste.com");

    //Digitar Nome
    const inputNameDisplayed = await inputName.isDisplayed();
    expect(inputNameDisplayed).toBe(true);

    await inputName.sendKeys("leonardo");

    //Digitar Sobrenome
    const inputSurNameDisplayed = await inputSurName.isDisplayed();
    expect(inputSurNameDisplayed).toBe(true);

    await inputSurName.sendKeys("Eiji");

    //Digitar Senha
    const inputPassDisplayed = await inputPass.isDisplayed();
    expect(inputPassDisplayed).toBe(true);

    await inputPass.sendKeys("12345");

    //Confirmar Senha
    const inputConfirmPassDisplayed = await inputConfirmPass.isDisplayed();
    expect(inputConfirmPassDisplayed).toBe(true);

    await inputConfirmPass.sendKeys("12345");

    //Check Termos
    const inputBoxDisplayed = await inputBox.isDisplayed();
    expect(inputBoxDisplayed).toBe(true);

    await inputBox.click();
    
    

    //Cadastrar
    const inputConfirmDisplayed = await inputConfirm.isDisplayed();
    expect(inputConfirmDisplayed).toBe(true);

    await inputConfirm.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Cadastro Realizado com Sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

         
    
  })

  test('Test Sign In Complete', async () => {
    const url = await driver.getCurrentUrl();
    
    expect(url).toBe('http://localhost:8080/deus-1.0-SNAPSHOT/login.xhtml');
    
  })

    
})