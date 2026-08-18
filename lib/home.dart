import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplestateprovider/sliderprovider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("data"), centerTitle: true),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("object eye");
              final slider = ref.watch(
                SliderProvider.select((state) => state.showpassword),
              );

              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(SliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    showpassword: !slider,
                  );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: slider
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.remove_red_eye_outlined),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(
                SliderProvider.select((state) => state.slider),
              );
              print("Build slider");

              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(SliderProvider);

              return Slider(
                value: slider.slider,
                onChanged: (value) {
                  final stateProvider = ref.read(SliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
