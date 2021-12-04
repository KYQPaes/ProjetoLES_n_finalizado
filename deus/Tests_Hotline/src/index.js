const { Builder, By, Key, until, Capabilities, WebElement } = require('selenium-webdriver');
const fs = require('fs');
require('chromedriver');

const driver = await new Builder()
  .forBrowser('chrome')
  .build();

  