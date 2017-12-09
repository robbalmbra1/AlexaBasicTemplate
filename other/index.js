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
    .then(() => nightmare.wait('.edw-voice-input'))
    .then(() => nightmare.check('.edw-toggle-switch-checkbox'))
    .then(() => nightmare.type('#edw-test-utteranceTextField',"test"))
    .then(() => nightmare.click('#edw-test-textAskButton'))
    .then(() => nightmare.wait(1500))
    .then(function(){
      return nightmare.evaluate(function(){
       	//return document.querySelector('.CodeMirror-code' > *).textContent;
        return  $('.cm-string').text(); 
        //return document.querySelector('.CodeMirror-code').innerHTML;
      });
    })
    .then((text) => {
	var splitlines = text.lines
	console.log(text);
	for(var i=0;i<splitlines.length; i+=1){
		if(i % 2 == 1){
			console.log(splitlines[i]);
		}
	}
    })
    .then(() => nightmare.end())


}else{
  console.log("index.js [USERNAME] [PASSWORD] [SKILL-ID]");
}
