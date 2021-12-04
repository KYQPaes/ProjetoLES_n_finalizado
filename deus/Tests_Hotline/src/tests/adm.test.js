const driver = require('../driver');
const { URL_SITE } = require('../settings');


describe('admin config', () => {
  beforeAll(async () => {
    await driver;
    await driver.get("http://localhost:8080/deus-1.0-SNAPSHOT/consulta_clientes.jsp");
  }, 10000);

//  afterAll(async () => {
//    await driver.quit();
//  }, 10000);

  test('Checking Title', async () => {
    const title = await driver.getTitle();
    // title = 'Titulo da pagina'
    expect(title).toBe('Consulta Clientes');
    
  })



  test('Navegate to cupom', async () => {
    const btn = await driver.findElement({ id: 'cupom' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Cupom Administrador');
    

  })




  test('generate empty input cupons', async () => {
    const btn1 = await driver.findElement({ id: 'cupomfrete' });
    const save = await driver.findElement({ id: 'save' });
   

    const btn1IsDisplayed = await btn1.isDisplayed();
    expect(btn1IsDisplayed).toBe(true);

    await btn1.click();


    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await save.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Campos Vazios"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

        

  })



  test('generate  frete cupom', async () => {
    const btn1 = await driver.findElement({ id: 'cupomfrete' });
    const validade = await driver.findElement({ id: 'validadeCupom' });
    const save = await driver.findElement({ id: 'save' });
   

    const btn1IsDisplayed = await btn1.isDisplayed();
    expect(btn1IsDisplayed).toBe(true);

    await btn1.click();


    const validadeIsDisplayed = await validade.isDisplayed();
    expect(validadeIsDisplayed).toBe(true);

    //await validade.click();

    await validade.sendKeys("30092021");



    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await save.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Cupom Cadastrado com sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

        

  })



  test('generate  troca cupom', async () => {
    const btn1 = await driver.findElement({ id: 'cupom5' });
    const validade = await driver.findElement({ id: 'validadeCupom' });
    const save = await driver.findElement({ id: 'save' });
   

    const btn1IsDisplayed = await btn1.isDisplayed();
    expect(btn1IsDisplayed).toBe(true);

    await btn1.click();


    const validadeIsDisplayed = await validade.isDisplayed();
    expect(validadeIsDisplayed).toBe(true);

    //await validade.click();

    await validade.sendKeys("30092021");



    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await save.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Cupom Cadastrado com sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

        

  })


  test('generate  10% cupom', async () => {
    const btn1 = await driver.findElement({ id: 'cupom10' });
    const validade = await driver.findElement({ id: 'validadeCupom' });
    const save = await driver.findElement({ id: 'save' });
   

    const btn1IsDisplayed = await btn1.isDisplayed();
    expect(btn1IsDisplayed).toBe(true);

    await btn1.click();


    const validadeIsDisplayed = await validade.isDisplayed();
    expect(validadeIsDisplayed).toBe(true);

    //await validade.click();

    await validade.sendKeys("30092021");



    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await save.click();

    const alert = await driver.switchTo().alert();
    expect(await alert.getText()).toBe("Cupom Cadastrado com sucesso"); //Print  await Alert popup
    await alert.accept(); //Close Alert popup

        

  })


  test('Navegate to contas', async () => {
    const btn = await driver.findElement({ id: 'consulta' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Consulta Clientes');
    

  })


  test('Navegate to contas pedidos', async () => {
    const btn = await driver.findElement({ id: 'view' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Detalhes Pedido');
    

  })


  test('Change order Status', async () => {
    const btn = await driver.findElement({ id: 'status' });
    const save = await driver.findElement({ id: 'save' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();


    await btn.sendKeys("EM TRANSPORTE");


    const saveIsDisplayed = await save.isDisplayed();
    expect(saveIsDisplayed).toBe(true);

    await save.click();



  })

  
    
})