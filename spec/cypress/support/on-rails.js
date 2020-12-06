const internalFactory = function(...options) {
  return cy.app('factory_bot', options).then(r => r[0]);
};

// CypressDev: don't remove these command
Cypress.Commands.add('appCommands', function(body) {
  cy.log("APP: " + JSON.stringify(body));
  return cy.request({
    method: 'POST',
    url: "/__cypress__/command",
    body: JSON.stringify(body),
    log: true,
    failOnStatusCode: true
  }).then((response) => {
    return response.body;
  });
});

Cypress.Commands.add('app', function(name, command_options) {
  return cy.appCommands({name: name, options: command_options}).then(response => response[0]);
});

Cypress.Commands.add('appScenario', function (name, options = {}) {
  return cy.app('scenarios/' + name, options)
});

Cypress.Commands.add('appEval', function (code) {
  return cy.app('eval', code)
});

/**
 * Adds cy.factory to create a single record using FactoryBot in the backend.
 * The resulting record's attributes can be accessed either via `.then()` or by saving
 * it in `this` using `.as('name')` (like fixtures).
 *
 * @param {String} type The type of record to be created in snake_case
 * @param {Array<String>} traits Traits defined in the corresponding factory
 * @param {Object} attributes Attributes to be assigned to generated record
 * @returns {Object} The generated record's attributes
 *
 * Usage examples:
 *   // Using a trait defined in spec/factories/posts.rb
 *   cy.factory('post', ['with_comments'], {title: 'Some Title'})
 *
 *   // Just passing in attributes without using traits
 *   cy.factory('event', [], {body: 'I am a great event!}
 *
 *   // Using the returned data using promise syntax
 *   cy.factory('post').then((record) => {
 *     console.log(record.title)
 *   })
 *
 *   // Saving the returned data for later
 *   cy.factory('post').as('myPost');
 *   console.log(this.myPost.title) // In a later block
 */
Cypress.Commands.add('factory', (type, traits = [], attributes = {}) =>
    internalFactory('create', type, ...traits, attributes)
);

/**
 * Adds cy.factoryList to create a list of records using FactoryBot in the backend.
 * @param {number} amount The amount of records to be created
 * @see #factory for more information
 * @returns {Array<Object>} The generated records' attributes
 *
 * Usage example:
 * cy.factoryList('post', 3, [], {title: 'I am a title})
 * // => [{...}, {...}, {...}]
 */
Cypress.Commands.add('factoryList', (type, amount, traits = [], attributes = {}) =>
    internalFactory('create_list', type, amount, ...traits, attributes)
);
// CypressOnRails: end

// The next is optional
// beforeEach(() => {
//  cy.app('clean') // have a look at cypress/app_commands/clean.rb
// });

// comment this out if you do not want to attempt to log additional info on test fail
Cypress.on('fail', (err, runnable) => {
  // allow app to generate additional logging data
  Cypress.$.ajax({
    url: '/__cypress__/command',
    data: JSON.stringify({name: 'log_fail', options: {error_message: err.message, runnable_full_title: runnable.fullTitle() }}),
    async: false,
    method: 'POST'
  });

  throw err;
});
