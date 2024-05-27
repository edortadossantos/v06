import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:menu_navigator/theme/colors.dart';
import 'package:menu_navigator/widget/ActivityStatus.dart';
import 'package:menu_navigator/widget/WaterIntakeProgressBar.dart';
import 'package:menu_navigator/widget/WaterIntakeTimeline.dart';
import 'package:menu_navigator/widget/Sleep.dart';
import 'package:menu_navigator/widget/WorkoutProgress.dart';
import 'package:menu_navigator/data/LatestWorkout.dart';


class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabecera pagina de Inicio (mensaje bienvenida + notificaciones)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenido",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Edorta",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/notifications");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Icon(Icons.notification_add),
                      ),
                    ),
                  ),
                ],
              ),
              // Primer recuadro azul
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [secondary, primary],
                  ),
                ),
                // Texto primer recuadro
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: (size.width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "IMC (Índice de Masa Corporal)",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Text(
                                "Estás en el peso ideal",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              // Botón "ver más"
                              Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [fourthColor, thirdColor]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    "Ver más",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Circúlo representando el IMC
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              LinearGradient(colors: [fourthColor, thirdColor]),
                        ),
                        child: const Center(
                          child: Text(
                            "20,3",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Segundo recuadro
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Objetivo diario",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/today_target_detail");
                        },
                        child: Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                              gradient:
                                  const LinearGradient(colors: [secondary, primary]),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "Ver",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Título "Estado de la actividad"
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Estado de la actividad",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              // Tercer recuadro
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: LineChart(activityData()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Frecuencia cardiaca",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // Cuarto recuadro vertical izquierda
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    // Recuadro blanco
                    width: (size.width - 80) / 2,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 20,
                            blurRadius: 10,
                            offset: const Offset(0, 10)),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // Contenido dentro del recuadro
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const WaterIntakeProgressBar(),
                          const SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                const Text(
                                  "Consumo de agua",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "Actualizaciones en tiempo real",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const WaterIntakeTimeLine(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      // Recuadro sueño
                      Container(
                        width: (size.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: const Offset(0, 10)),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Sueño",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Flexible(
                                child: LineChart(
                                  sleepData(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Recuadro calorias
                      Container(
                        width: (size.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: const Offset(0, 10)),
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Calorias",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        colors: [
                                          fourthColor,
                                          primary.withOpacity(0.5)
                                        ]),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: primary),
                                    child: const Center(
                                      child: Text(
                                        "3.200 cal",
                                        style: TextStyle(
                                            fontSize: 10, color: white),
                                      ),
                                    ),
                                  ),
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
              // Titulo Progreso entrenamiento + Selector periodo
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Titulo
                  const Text("Progreso del entrenamiento",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),),
                  //Selector
                  Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [secondary,primary]),
                    borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Semanal",style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),),
                        Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                      ],
                    ),
                  ),
                ],
              ),
              // Grafico progreso entrenamiento
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.01),
                      spreadRadius: 20,
                      blurRadius: 10,
                      offset: const Offset(0, 10)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: LineChart(
                  workoutProgressData(),
                ),
              ),
              // Titulo últimos entrenamientos + ver más
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Últimos entrenamientos",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                   Text(
                          "Ver más",
                          style: TextStyle(fontSize: 15, color: black.withOpacity(0.5)),
                        ),
                ],
              ),
              // Bloques últimos entrenamientos
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(latestWorkoutJson.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.01),
                        spreadRadius: 20,
                        blurRadius: 10,
                        offset:const Offset(0, 10)
                      )
                    ],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(latestWorkoutJson[index]['img']))
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Flexible(
                          child: SizedBox(
                            height: 55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(latestWorkoutJson[index]['title'],style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight:FontWeight.bold
                                ),),
                                Text(latestWorkoutJson[index]['description'],style: TextStyle(
                                  fontSize: 13,
                                  color: black.withOpacity(0.5)
                                ),),
                                Stack(
                                  children:[
                                    Container(
                                      width: size.width,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgTextField
                                      ),
                                    ),
                                    Container(
                                      width: size.width*(latestWorkoutJson[index]['progressBar']),
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(colors: [
                                          primary, secondary
                                        ])
                                      ),
                                    )
                                  ]
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primary
                            )
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_forward_ios,size:11,color:primary),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
