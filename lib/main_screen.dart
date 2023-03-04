import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/get_location.dart';
import 'package:weather_app/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE,d MMM,yyyy').format(dayInfo);

class MainScreen extends StatelessWidget {
  var Client = weatherData();
  var data;

  info() async {
    var position = await GetPosition();
    data = await Client.getData(position.latitude, position.longitude);
    return data;
  }

  String dayNightIcon() {
    if ((data?.is_day) == 0) {
      return 'assets/images/night.png';
    } else {
      return 'assets/images/sunny.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                height: size.height * 0.75,
                width: size.width,
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff955cd1),
                      Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.85],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      '${data?.cityName}',
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 35,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dateFormat,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 21),
                    Image.asset(
                      dayNightIcon(),
                      width: size.width * 0.20,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${data?.condition}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '  ${data?.temp}º',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 76,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 10),

                    ///---------------------------------------
                    ///  ///---------------------------------------
                    ///    ///---------------------------------------
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/storm.png',
                                width: size.width * 0.12,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${data?.wind} km/h',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                width: size.width * 0.12,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${data?.humidity}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Humidity',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wind.png',
                                width: size.width * 0.12,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data?.wind_dir}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Wind\nDirection',
                                // maxLines: 2,
                                // overflow: TextOverflow.clip,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Gust',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.gust} kp/h',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Pressure',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.pressure}hpa',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'UV',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.uv} kp/h',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Precipitation',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.precipe} mm',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Wind',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.wind} km/h',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Last Updated',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data?.last_update}',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}
