import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additiona_info_item.dart';
import 'package:weather_app/weather_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {
    final res = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Siena'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wheater App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '35° C',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '28',
                  ),
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '28',
                  ),
                  HourlyForecastItem(
                    time: '12:00',
                    icon: Icons.wind_power,
                    temperature: '18',
                  ),
                  HourlyForecastItem(
                    time: '10:00',
                    icon: Icons.sunny,
                    temperature: '31',
                  ),
                  HourlyForecastItem(
                    time: '06:00',
                    icon: Icons.cloud,
                    temperature: '12',
                  ),
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '28',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.5k',
                ),
                AdditionalInfoItem(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1000',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
