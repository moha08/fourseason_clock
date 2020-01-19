import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter_clock_helper/model.dart';

const double kIconWeatherSize = 30.0;
const double kStokeWidth = 10.0;
const double kTimeUnitFontSize = 60.0;

const kWeatherIcons = <String, Icon>{
  "sunny": Icon(
    WeatherIcons.day_sunny,
    size: kIconWeatherSize,
    color: Color(0xFFF8E57C),
  ),
  "cloudy": Icon(
    WeatherIcons.cloudy,
    size: kIconWeatherSize,
    color: Color(0xFFCADCE7),
  ),
  "foggy": Icon(
    WeatherIcons.fog,
    size: kIconWeatherSize,
    color: Color(0xFFD3DCE2),
  ),
  "rainy": Icon(
    WeatherIcons.rain,
    size: kIconWeatherSize,
    color: Color(0xFF8EB5CC),
  ),
  "snowy": Icon(
    WeatherIcons.snow,
    size: kIconWeatherSize,
    color: Color(0xFFB3BDC8),
  ),
  "thunderstorm": Icon(
    WeatherIcons.thunderstorm,
    size: kIconWeatherSize,
    color: Color(0xFF5B6166),
  ),
  "windy": Icon(
    WeatherIcons.windy,
    size: kIconWeatherSize,
    color: Color(0xFFA5B5C2),
  ),
};

const kClockThemePerWeather = <WeatherCondition, List<Color>>{
  WeatherCondition.foggy: [
    Color(0xFFE4E4E6),
    Color(0xFFC4BDB5),
    Color(0xFF4B6055),
  ],
  WeatherCondition.sunny: [
    Color(0xFFFAD958),
    Color(0xFFB5BB19),
    Color(0xFFE6A503),
  ],
  WeatherCondition.cloudy: [
    Color(0xFFE3E9E9),
    Color(0xFF9BADC1),
    Color(0xFF25496B),
  ],
  WeatherCondition.rainy: [
    Color(0xFFA5A29D),
    Color(0xFFCEDEDE),
    Color(0xFF6C7386),
  ],
  WeatherCondition.snowy: [
    Color(0xFFFBFCFC),
    Color(0xFFA3B1BC),
    Color(0xFF5779A6),
  ],
  WeatherCondition.thunderstorm: [
    Color(0xFF717A7D),
    Color(0xFF2F455D),
    Color(0xFF0E1E31)
  ],
  WeatherCondition.windy: [
    Color(0xFFCEBF96),
    Color(0xFF7C5C46),
    Color(0xFF5B3C18),
  ],
};
