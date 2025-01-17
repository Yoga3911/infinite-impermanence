// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:faker_dart/faker_dart.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// 🌎 Project imports:
import '../../../../../common/style.dart';
import '../../../../../common/waves.dart';
import '../../../controllers/home_controller.dart';

class Greeting extends StatelessWidget {
  Greeting({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 80,
          child: WaveWidget(
            config: CustomConfig(
              colors: WavesSettings.waveColors,
              heightPercentages: WavesSettings.waveHeightPercentages,
              durations: WavesSettings.waveDurations,
            ),
            waveAmplitude: 10,
            size: const Size(double.infinity, double.infinity),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Row(
            children: [
              FutureBuilder(
                future: controller.img,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Shimmer(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.grey,
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        snapshot.data.toString(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Selamat ${controller.greeting()}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Text(
                    controller.faker.name.firstName(
                      gender: Gender.female,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor,
                    ),
                  ),
                  // Date text now
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 65,
          right: 10,
          child: Text(
            controller.dateNow(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
