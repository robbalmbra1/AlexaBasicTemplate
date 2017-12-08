import * as Alexa from "alexa-sdk";

var languageStrings = {
    'en': {
			'translation': {
				'ABOUT_MESSAGE': 'This skill was written by ${FULL_NAME}',
				'APP_NAME': '${APP_NAME}',
				'COMMAND_MESSAGE': 'Say such commands like: \'${PHRASE_1}\',\'${PHRASE_2}\' and \'${PHRASE_3}\'. So how can I help?',
				'ASK_MESSAGE': 'So, how can I help?',
				'LAUNCH_MESSAGE':'Welcome to ${APP_NAME}, so how can I help?',
				'CONN_ERROR_MESSAGE':'Error - Failed to connect to server.',
				'GOODBYE':'Goodbye!'
			}
    },
    'de-DE': {
			'translation': {
				'ABOUT_MESSAGE': 'Diese Fähigkeit wurde von ${FULL_NAME} geschrieben',
				'APP_NAME': '',
				'COMMAND_MESSAGE': '',
				'ASK_MESSAGE': 'Also, wie kann ich helfen?',
				'LAUNCH_MESSAGE':'',
				'CONN_ERROR_MESSAGE':'Fehler - Verbindung zum Server konnte nicht hergestellt werden.',
				'GOODBYE':'Auf Wiedersehen!'
			}
    }
};

let handlers: Alexa.Handlers = {
	'AboutIntent': function() {
		let self: Alexa.Handler = this;
		let speechOutput = this.t('ABOUT_MESSAGE');
		self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput);
	},
	'AMAZON.StopIntent': function () {
		let self: Alexa.Handler = this;
		let speechOutput = this.t('GOODBYE');
		self.emit(":tell", speechOutput, this.t('APP_NAME'), speechOutput);
	},
	'AMAZON.CancelIntent': function () {
		let self: Alexa.Handler = this;
		let speechOutput = this.t('GOODBYE');
		self.emit(":tell", speechOutput, this.t('APP_NAME'), speechOutput);
	},
	'AMAZON.HelpIntent': function () {
		let self: Alexa.Handler = this;
		let speechOutput = this.t('COMMAND_MESSAGE');
		let repromptText = this.t('ASK_MESSAGE');
		this.emit(':ask', speechOutput, repromptText);
	},
	'LaunchRequest': function () {
		let self: Alexa.Handler = this;
		var speechOutput = this.t('LAUNCH_MESSAGE');
		var repromptText = this.t('ASK_MESSAGE');
		this.emit(':ask', speechOutput, repromptText);
	},
	'WelcomeIntent': function () {
		let self: Alexa.Handler = this;
		var speechOutput = "";
		self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput);
	},
	'OtherIntent': function () {
		let self: Alexa.Handler = this;
		var speechOutput = "";
		self.emit(":tellWithCard", speechOutput, this.t('APP_NAME'), speechOutput)
	}
}

export class handler {
	constructor(event: Alexa.RequestBody, context: Alexa.context, callback: Function) {
		let alexa = Alexa.handler(event, context);
		alexa.appId = "${SKILL_ID}";
		alexa.resources = languageStrings;
		alexa.registerHandlers(handlers);
		alexa.execute();
	}
}
