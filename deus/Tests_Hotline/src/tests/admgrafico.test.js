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



  test('Navegate to grafico', async () => {
    const btn = await driver.findElement({ id: 'graficos' });

    const btnIsDisplayed = await btn.isDisplayed();
    expect(btnIsDisplayed).toBe(true);

    await btn.click();

    const title = await driver.getTitle();
    expect(title).toBe('Consulta de Clientes');


  })


  test('select date 1', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("03102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })

  test('select date 2', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("05102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();

    
        

  })


  test('select date 3', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("06102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })



  test('select date 4', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("10102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })



  test('select date 5', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("12102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })

  test('select date 6', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("13102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })
  
  test('select date 7', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("15102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })

  test('select date 8', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("18102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })


  test('select date 9', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("20102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })


  test('select date 10', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("25102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })



  test('select date 11', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("28102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })


  test('select date 12', async () => {
    
    const btn2 = await driver.findElement({ id: 'date2' });
    const enter = await driver.findElement({ id: 'enter' });
   

    const btn2IsDisplayed = await btn2.isDisplayed();
    expect(btn2IsDisplayed).toBe(true);

    
    await btn2.sendKeys("31102021");

    const enterIsDisplayed = await enter.isDisplayed();
    expect(enterIsDisplayed).toBe(true);

    await enter.click();


        

  })







  

  
    
})