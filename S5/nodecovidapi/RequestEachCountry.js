

// covide api link
const url = "https://api.covid19api.com/countries";
const getCountry =  CountryName => "https://api.covid19api.com/country/"+CountryName;

const request = require('request');
const json2csv = require('json2csv');
const fs = require('fs');

request({url: url, json: true}, (error, response) => {
    if(error){
        console.log('Unable to connect to the server');
    }
    if(!response.statusCode === 200){
        console.log("expected status code 200, but got " + response.statusCode);
    }
    // get status for each country
    response.body.forEach(country => {
        const countryUrl = getCountry(country.Slug);
        request({url: countryUrl, json: true}, (error, response) => {
            if(error){
                console.log('Unable to connect to the server');
            }
            if(!response.statusCode === 200){
                console.log("expected status code 200, but got " + response.statusCode);
            }
            const csv = json2csv.parse(response.body);
            const fileName = "./coutriesStats/"+country.Slug + ".csv"; 
            // write to file
            fs.writeFile(fileName, csv, (err) => {
                if(err) throw err;
                console.log('file saved');
                // clenup console
                console.clear();
            });
        });
    });
});