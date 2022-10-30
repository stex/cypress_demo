const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    // We do not use CYPRESS_BASE_URL here as we want to utilize the same env variable
    // with wait-on to ensure the server is running (which needs a different scheme)
    baseUrl: `http://${process.env.BASE_URL || 'localhost:3000'}`,
    defaultCommandTimeout: 10000,
    supportFile: "support/index.js",
    specPattern: 'e2e/**/*.cy.{js,jsx,ts,tsx}',
    fixturesFolder: 'fixtures',
  }
})
