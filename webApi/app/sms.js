var http = require('http');
exports.sms_me = function postToUserKin(myNumber){

    const data = JSON.stringify({
        messages: [
          {
            from: "InfoSMS",
            destinations: [
              {
                to: "+27730783071"
              },
            ],
            text: "Welcome to Noodles Wilson. Your policy number is: 223-344."
          }
        ]
      })
    
    const options = {
      hostname: 'r5qywm.api.infobip.com',
      port: 443,
      path: '/sms/2/text/advanced',
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Authorization': "App a8ab0cf38280d1a1e87b51216bb6dd9f-49f22768-5e24-48c8-b9e3-bb4df8aaeb6b",
        'Content-type': 'application/json',
      }
    }
    
    const req = http.request(options, res => {
      console.log(`statusCode: ${res.statusCode}`)
    
      res.on('data', d => {
        process.stdout.write(d)
      })
    })
    
    req.on('error', error => {
      console.error(error)
    })
    
    req.write(data)
    req.end()






    // const httpHeaders = new httpHeaders({
    //   'Accept': 'application/json',
    //   'Authorization': "App a8ab0cf38280d1a1e87b51216bb6dd9f-49f22768-5e24-48c8-b9e3-bb4df8aaeb6b",
    //   'Content-type': 'application/json',
    // })

    // const body = {
    //   "messages": [
    //     {
    //       "from": "InfoSMS",
    //       "destinations": [
    //         {
    //           "to": myNumber
    //         },
    //       ],
    //       "text": "Safety notify; Issa has boadered the taxi."
    //     }
    //   ]
    // }

    // let response = http.post("https://r5qywm.api.infobip.com/sms/2/text/advanced",body, {headers: httpHeaders}).subscribe();
    // return response
};



