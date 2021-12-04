const { Builder, By, Key, until, Capabilities, WebElement } = require('selenium-webdriver');
require('chromedriver');

const driver = new Builder()
  .forBrowser('chrome')
  .build();

module.exports = driver;