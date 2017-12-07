const context = require("aws-lambda-mock-context");
var expect = require("chai").expect;
var index = require("../index");

const ctx = context();
describe("Testing the Intent", function() {

        var speechResponse = null;
        var speechError = null;

        before(function(done) {
                index.Handler({}, ctx);
                ctx.Promise
                        .then(response => {speechResponse = response; console.log(speechResponse); done(); })
                        .catch(error => { speechError = error; done(); })
        });

        describe("Is the response structurally correct", function() {
                it("should not have errored", function() {
                        expect(speechError).to.be.null;
                });
        });
});
