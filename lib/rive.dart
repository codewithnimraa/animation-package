import 'package:animation/control_based.dart';
import 'package:animation/time_based.dart';
import 'package:flutter/material.dart';

class RivePage extends StatelessWidget {
  const RivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rive + Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 250, 143, 179),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Color.fromARGB(255, 250, 143, 179),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TimeBased()));
                },
                child: const Text(
                  'Rive + Timer',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Color.fromARGB(255, 250, 143, 179),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ControlledPage()));
                },
                child: const Text(
                  'Rive + Slider',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            const SizedBox(
              height: 60,
            ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         'assets/gb.png',
            //         width: 50,
            //       ),
            //       const Text(
            //         'obaloluwaobi',
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontStyle: FontStyle.italic,
            //             color: Colors.black),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
