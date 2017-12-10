var Nightmare = require('nightmare');
require('string-lines')
const nightmare = Nightmare({ show: true, waitTimeout: 1000000});

var myArgs = process.argv.slice(2);
if(myArgs.length == 3){
  nightmare
    .goto('https://developer.amazon.com/home.html')
    .type('#ap_email', myArgs[0])
    .type('#ap_password', myArgs[1])
    .click('#signInSubmit')
    .wait('.communications')
    .then(() => nightmare.goto('https://developer.amazon.com/edw/home.html#/skill/' + myArgs[2]  + '/en_US/testing'))
    .then(() => nightmare.wait('#EdwAppEnableToggle'))
    .then(() => nightmare.check('#EdwAppEnableToggle'))
    .then(() => nightmare.wait(5000))
    .then(() => console.log("Success - Skill testing has been enabled"))
    .then(() => nightmare.end())

}else{
  console.log("index.js [USERNAME] [PASSWORD] [SKILL-ID]");
}
