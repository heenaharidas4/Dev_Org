public with sharing class WeatherInfo {

public String Temperature;

Public string Zip {get;set;}
Public string city {get;set;}
public string state {get;set;}
public string wind {get; set;}
public string remarks {get; set;}
public string pressure {get; set;}

wsCdyneComWeatherws.Weathersoap w = new wsCdyneComWeatherws.Weathersoap();
wsCdyneComWeatherws.WeatherReturn weatherreturn1 = w.GetCityWeatherByZIP(+this.Zip);

 public string gettemperature (){
wsCdyneComWeatherws.WeatherReturn weatherreturn1 = w.GetCityWeatherByZIP(+this.Zip);
 Temperature = weatherreturn1.Temperature;
 City=weatherreturn1.city;
 state=weatherreturn1.state;
 wind= weatherreturn1.wind;
 remarks=weatherreturn1.remarks;
 pressure=weatherreturn1.pressure;
 return weatherreturn1.Temperature;
 
 }
 }