import 'package:countries/core/widgets/profile_shimmer.dart';
import 'package:countries/core/widgets/text_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  final int length;
  final EdgeInsets padding;

  const ShimmerList(
      {super.key, required this.length, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  child: const ProfileShimmer()),
              const SizedBox(
                width: 20,
              ),
              const Column(
                children: [
                  TextShimmer(width: 100, height: 10),
                  SizedBox(
                    height: 30,
                  ),
                  TextShimmer(width: 50, height: 8),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}
