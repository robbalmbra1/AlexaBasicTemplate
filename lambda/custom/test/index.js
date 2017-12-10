const context = require("aws-lambda-mock-context");
var expect = require("chai").expect;
var index = require("../index");

const ctx = context();
describe("Testing the Intent", function() {

        var speechResponse = null;
        var speechError = null;

        before(function(done) {
                index.handler({
  "session": {
    "new": true,
    "sessionId": "SessionId.593944-DFXF4-D3453RG45TV45Y-CRT4C2HV",
    "application": {
      "applicationId": "${SKILL_ID}"
    },
    "attributes": {},
    "user": {
      "userId": "amzn1.ask.account.3849SDFMSDMSE8W48R8SMCSMDFM394RTMESEG"
    }
  },
  "request": {
    "type": "IntentRequest",
    "requestId": "EdwRequestId.6W544534504D-XFGS45ZDFGDFG-EFJ56DG54G-DRGDR",
    "intent": {
      "name": "WelcomeIntent",
      "slots": {}
    },
    "locale": "en-US",
    "timestamp": "2017-12-10T16:23:13Z"
  },
  "context": {
    "AudioPlayer": {
      "playerActivity": "IDLE"
    },
    "System": {
      "application": {
        "applicationId": "${SKILL_ID}"
      },
      "user": {
        "userId": "amzn1.ask.account.3849SDFMSDMSE8W48R8SMCSMDFM394RTMESEG"
      },
      "device": {
        "supportedInterfaces": {}
      }
    }
  },
  "version": "1.0"
}, ctx);
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
