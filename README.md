# AlexaBasicTemplate

### Prerequisites
Basic template and interactive frontend for ask CLI.

Run `ask init` to login to your amazon account via your browser, if you havent got ask, install it `npm install -g ask-cli`.

You may need to link aws lambda to your ask configuration if it hasnt been set up:

`pip install awscli && awscli configure`

Enter your root secret and access keys from your AWS root account or a AWS IAM account.

More information about ask cli can be found [here](https://developer.amazon.com/docs/smapi/quick-start-alexa-skills-kit-command-line-interface.html) and awscli can be found [here](https://aws.amazon.com/cli/)

tsc is also a required package, install it by running `npm install tsc -g`.

Then Download and run FrontEnd.sh, once run answer the questions, this will generate the needed files to deploy the skill.

### Download

`wget https://raw.githubusercontent.com/robbalmbra1/AlexaBasicTemplate/master/FrontEnd.sh && chmod 700 FrontEnd.sh`

### Usage

Run `./FrontEnd.sh` to initiate a range of questions, these will generate the skill basic format and push it to alexa skill services and AWS lambda.

Consecutive updates to the lambda function or skill information can be achieved by altering files within the generated directory and deployed using `ask deploy` within the app root.

### Issues

- Duplication of more than one custom slot type will cause the alexa uploading process to fail.
