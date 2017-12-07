"use strict";
exports.__esModule = true;
var Alexa = require("alexa-sdk");
var languageStrings = {
    'en': {
        'translation': {
            'ABOUT_MESSAGE': 'This skill was written by Robert Balmbra',
            'APP_NAME': '',
            'COMMAND_MESSAGE': 'Say such commands like: \'\',\'\' and \'\'. So how can I help?',
            'ASK_MESSAGE': 'So, how can I help?',
            'LAUNCH_MESSAGE': 'Welcome to testdelete, so how can I help?',
            'CONN_ERROR_MESSAGE': 'Error - Failed to connect to server.',
            'GOODBYE': 'Goodbye!'
        }
    },
    'de-DE': {
        'translation': {
            'ABOUT_MESSAGE': 'Diese Fähigkeit wurde von Robert Balmbra geschrieben',
            'APP_NAME': '',
            'COMMAND_MESSAGE': '',
            'ASK_MESSAGE': 'Also, wie kann ich helfen?',
            'LAUNCH_MESSAGE': '',
            'CONN_ERROR_MESSAGE': 'Fehler - Verbindung zum Server konnte nicht hergestellt werden.',
            'GOODBYE': 'Auf Wiedersehen!'
        }
    }
};
var handlers = {
    'AboutIntent': function () {
        var self = this;
        var speechOutput = this.t('ABOUT_MESSAGE');
        self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput);
    },
    'AMAZON.StopIntent': function () {
        var self = this;
        var speechOutput = this.t('GOODBYE');
        self.emit(":tell", speechOutput, this.t('APP_NAME'), speechOutput);
    },
    'AMAZON.CancelIntent': function () {
        var self = this;
        var speechOutput = this.t('GOODBYE');
        self.emit(":tell", speechOutput, this.t('APP_NAME'), speechOutput);
    },
    'AMAZON.HelpIntent': function () {
        var self = this;
        var speechOutput = this.t('COMMAND_MESSAGE');
        var repromptText = this.t('ASK_MESSAGE');
        this.emit(':ask', speechOutput, repromptText);
    },
    'LaunchRequest': function () {
        var self = this;
        var speechOutput = this.t('LAUNCH_MESSAGE');
        var repromptText = this.t('ASK_MESSAGE');
        this.emit(':ask', speechOutput, repromptText);
    },
    'WelcomeIntent': function () {
        var self = this;
        var speechOutput = "";
        self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput);
    },
    'OtherIntent': function () {
        var self = this;
        var speechOutput = "";
        self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput);
    }
};
var Handler = /** @class */ (function () {
    function Handler(event, context, callback) {
        var alexa = Alexa.handler(event, context);
        alexa.appId = "";
        alexa.resources = languageStrings;
        alexa.registerHandlers(handlers);
        alexa.execute();
    }
    return Handler;
}());
exports.Handler = Handler;
