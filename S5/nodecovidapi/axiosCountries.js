

// covide api link
const url = "https://api.covid19api.com/countries";
const getCountry =  CountryName => "https://api.covid19api.com/country/"+CountryName;

const json2csv = require('json2csv');
const axios = require('axios');
const fs = require('fs');

async function getCountries(){
    const response = await axios.get(url);
    console.log(response.data[0]);
    const countryUrl = getCountry(response.data[1].Slug);
    const response2 = await axios.get(countryUrl);
    const csv = json2csv.parse(response2.data);
    const fileName = "./AxiosCountriesStats/"+response.data[0].Slug + ".csv"; 
    // write to file
    fs.writeFile(fileName, csv, (err) => {
        if(err) throw err;
        console.log('file saved');
        // clenup console
        console.clear();
    });
};

getCountries();