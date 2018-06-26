/*
 __                                   __                  
|__)  _  _   _   _  _   _   _   _  _ /    _  | |_  _   _  
|    |  (_) (_) |  (_| ||| ||| (- |  \__ (_) | |_ (_) | ) 
            _/
__________________________________________________________
*/

//Variables:
const express = require("express");
const themepark = require("themeparks");
var client = express();

var settings = {
    port: process.env.PORT || 80,
    auth_token: process.env.TOKEN_KEY,
};

/*
Layout:

/parks/list => return all parks.
/parks/[park name] => return data regarding park.
/parks/[park name]/rides => return all rides in the park.
/parks/[parnk name]/ride/[ride name] => return data regarding ride in park.

*/

function getPark(park, res){
    let parkConstructor = new themepark.Parks[park]();
    if(parkConstructor){
        return parkConstructor;
    } else {
        res.end("Error: Park constructor is null.");
    }
}

function checkAuthentication(req, res){
    let token = req.headers.token;
    if(settings.auth_token == token){
        return true;
    } else {
        return false;
    }
}

client.get("/parks/list", function(req, res, next){
    if(!checkAuthentication(req, res)){
        return res.end("Error: Authentication key invalid.");
    }
    var data = [];
    for(var park in themepark.Parks){
        data.push({name: new themepark.Parks[park]().Name, id: park});
    }
    res.json(data);
});

client.get("/parks/:park/rides", function(req, res, next){
    if(!checkAuthentication(req, res)){
        return res.end("Error: Authentication key invalid.");
    }
    let params = req.params;
    if(params.park){
        let park = getPark(params.park, res);
        var data = [];     
        park.GetWaitTimes(function(err, rides){
            if(err){
                return res.end("Error: " + err);
            }
            for(var i = 0, ride; ride = rides[i++];){
                data.push(ride);
            };
            res.json(data);
        });
    } else {
        res.end("Error: Park param. not specified.");
    }
});

client.get("/parks/:park/ride/:ride", function(req, res, next){
    if(!checkAuthentication(req, res)){
        return res.end("Error: Authentication key invalid.");
    }
    let params = req.params;
    if(params.park){
        let park = getPark(params.park, res);
        let ride = params.ride;
        if(ride){
            var data = [];     
            park.GetWaitTimes(function(err, rides){
            if(err){
                return res.end("Error: " + err);
            }
            for(var i = 0, r; r = rides[i++];){
                if(r.name == ride){
                    data.push(r);
                }
            };
            res.json(data);
        });
        } else {
            res.send("Error: Ride param. not specified.");
        }
    } else {
        res.end("Error: Park param. not specified.");
    }
});

client.listen(settings.port, function(err){
    if(err){
        return res.end("Error: " + err);
    } else {
        console.log("Server is up and running and listening on port: " + settings.port);
    }
});

