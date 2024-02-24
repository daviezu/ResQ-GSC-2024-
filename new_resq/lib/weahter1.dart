import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_resq/components/navbar.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  String _apiKey = '4e93fb64dbb7dc38f74c2ba52ff9205c';
  String _weatherIconUrl = '';
  String _cityName = '';
  String _temperature = '';
  String _description = '';
  List<dynamic> _hourlyForecast = [];

  Future<void> getWeather(String city) async {
    String currentWeatherUrl =
        'https://api.openweathermap.org/data/2.5/weather?units=metric&q=$city&appid=$_apiKey';
    String forecastUrl =
        'https://api.openweathermap.org/data/2.5/forecast?units=metric&q=$city&appid=$_apiKey';

    try {
      http.Response currentWeatherResponse =
          await http.get(Uri.parse(currentWeatherUrl));
      http.Response forecastResponse = await http.get(Uri.parse(forecastUrl));

      if (currentWeatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        Map<String, dynamic> currentWeatherData =
            jsonDecode(currentWeatherResponse.body);
        Map<String, dynamic> forecastData = jsonDecode(forecastResponse.body);

        setState(() {
          _cityName = currentWeatherData['name'];
          _temperature = currentWeatherData['main']['temp'].toString();
          _description = currentWeatherData['weather'][0]['description'];
          _weatherIconUrl =
              'https://openweathermap.org/img/wn/${currentWeatherData['weather'][0]['icon']}.png';
          _hourlyForecast = forecastData['list'].sublist(0, 8);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
              style: TextStyle(
                fontFamily: 'EmblemaOne',
                fontSize: 25,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Res',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Q',
                  style: TextStyle(color: Colors.red[800]),
                )
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   'Weather App',
              //   style: TextStyle(
              //     fontSize: 24.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  getWeather(_cityController.text);
                },
                child: Text('Search'),
              ),
              SizedBox(height: 20.0),
              _weatherIconUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: _weatherIconUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 100.0,
                      height: 100.0,
                    )
                  : Container(),
              SizedBox(height: 10.0),
              Text(
                '$_cityName',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$_temperature°C',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$_description',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Hourly Forecast',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Container(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _hourlyForecast.length,
                  itemBuilder: (context, index) {
                    var forecastItem = _hourlyForecast[index];
                    var dateTime = DateTime.fromMillisecondsSinceEpoch(
                        forecastItem['dt'] * 1000);
                    var hour = dateTime.hour;
                    var temperature = forecastItem['main']['temp'].toString();
                    var iconUrl =
                        'https://openweathermap.org/img/wn/${forecastItem['weather'][0]['icon']}.png';

                    return Container(
                      width: 80.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$hour:00',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          CachedNetworkImage(
                            imageUrl: iconUrl,
                            width: 50.0,
                            height: 50.0,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '$temperature°C',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
