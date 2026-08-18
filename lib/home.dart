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
              final slider = ref.watch(SliderProvider);

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
                value: slider,
                onChanged: (value) {
                  ref.read(SliderProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
