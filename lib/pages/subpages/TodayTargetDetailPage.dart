import 'package:flutter/material.dart';
import 'package:menu_navigator/data/LatestWorkout.dart';
import 'package:menu_navigator/theme/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodayTargetDetailPage extends StatefulWidget {
  const TodayTargetDetailPage({super.key});

  @override
  State<TodayTargetDetailPage> createState() => _TodayTargetDetailPageState();
}

class _TodayTargetDetailPageState extends State<TodayTargetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Botón retroceder
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            // Título
            const Text(
              "Registro de actividad",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            // Botón tres puntos
            IconButton(
                onPressed: () {},
                icon: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Icon(
                      Icons.more_horiz,
                      size: 22,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                )),
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            // Primer recuadro
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      // Título objetivo del día
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Objetivo del día",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        // Botón +
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Recuadro agua diaria dentro del primer recuadro
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1, // Flex del primer elemento
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/glass.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                Text(
                                  "Consumo de agua",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          flex: 1, // Flex del segundo elemento
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/foot_step.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                Text(
                                  "Pasos",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Titulo Progreso actividad + Selector periodo
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Titulo
                const Text(
                  "Progreso de la actividad",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                //Selector
                Container(
                  width: 95,
                  height: 35,
                  decoration: BoxDecoration(
                    gradient:
                        const LinearGradient(colors: [secondary, primary]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Semanal",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Segundo recuadro
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 20,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.01),
                      offset: const Offset(0, 1)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekly.length, (index) {
                    return Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Container(
                                width: 20,
                                height: size.height,
                                decoration: BoxDecoration(
                                    color: bgTextField,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 20,
                                  height: size.height * (weekly[index]['count']),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: weekly[index]['color']),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          weekly[index]['day'],
                          style: const TextStyle(fontSize: 13),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
            // Titulo última actividad + botón ver más
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Última actividad",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Ver más",
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.5)),
                ),
              ],
            ),
            // Recuadros última actividad
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(latestActivityJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.01),
                              spreadRadius: 20,
                              blurRadius: 10,
                              offset: const Offset(0, 1)),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Imagen recuadro última actividad 1
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          latestActivityJson[index]['img'])),
                                ),
                              ),
                              // Texto dentro recuadro última actividad 1
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 55,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      latestActivityJson[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      latestActivityJson[index]['time_ago'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Icon(
                            Icons.more_vert,
                            size: 15,
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
