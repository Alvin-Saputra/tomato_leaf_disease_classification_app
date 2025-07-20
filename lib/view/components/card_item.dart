import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/models/leaf.dart';
import 'package:leaf_disease_classification_app/view/screens/detail_screen.dart';

class CardItem extends StatelessWidget {
  CardItem({required this.leafData, super.key});

  LeafDisease leafData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          // ⬅️ Kunci utama!
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          leafData.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text("Indoor", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(leafData),
                          ),
                        );
                      },
                      icon: const Text("Details"),
                      label: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Image.asset(
                leafData.imageAsset[0],
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
