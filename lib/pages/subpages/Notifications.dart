import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:menu_navigator/theme/colors.dart';
import 'package:menu_navigator/data/Notifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
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
            // Título Notificaciones
            const Text(
              "Notificaciones",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
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
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  // Recuadros notificaciones
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                
                children: List.generate(notificationsJson.length, (index) {
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
                                offset: const Offset(0, 10))
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          notificationsJson[index]['image']))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: 55,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notificationsJson[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      notificationsJson[index]['time'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    // Barra progreso (quitar)
                                    Stack(children: [
                                      Container(
                                        width: size.width,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: bgTextField),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primary)),
                              child: const Center(
                                child: Icon(Icons.arrow_forward_ios,
                                    size: 11, color: primary),
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
