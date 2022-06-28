import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key, this.parseWeatherData}) : super(key: key);

  final dynamic parseWeatherData;

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {

  late String cityName;
  late int temperature;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe79e4a),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 150.0),
                      Text(
                        'Seoul',
                        style: GoogleFonts.lato(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic(
                            const Duration(minutes: 1),
                            builder: (context) {
                              return Text(
                                getSystemTime(),
                                style: GoogleFonts.lato(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              );
                            }
                          ),
                          Text(
                            DateFormat(' - EEEE, d ').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            DateFormat('MMM, yyy').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '18℃',
                        style: GoogleFonts.lato(
                          fontSize: 85.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('images/svg/climacon-sun.svg'),
                          const SizedBox(width: 10.0),
                          Text(
                            'clear sky',
                            style: GoogleFonts.lato(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(
                  height: 15.0,
                  thickness: 2.0,
                  color: Colors.white30
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'AQI(대기질지수)',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Image.asset(
                          'images/png/bad.png',
                          width: 37.0,
                          height: 35.0,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '"매우나쁨"',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '미세먼지',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '174.75',
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '㎍/m3',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '초미세먼지',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '84.03',
                          style: GoogleFonts.lato(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '㎍/m3',
                          style: GoogleFonts.lato(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];

    double rawTemperature = weatherData['main']['temp'];
    temperature = rawTemperature.round();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }
}
