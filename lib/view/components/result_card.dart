import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/models/leaf.dart';
import 'package:leaf_disease_classification_app/view/components/carousel_widget.dart';
import 'package:leaf_disease_classification_app/view/screens/detail_screen.dart';

class ResultCard extends StatelessWidget {
  ResultCard(this.leafDiseaseData, {super.key});

  LeafDisease leafDiseaseData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(leafDiseaseData.imageAsset[0], height: 75, width: 75),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Disease", style: TextStyle(fontSize: 12)),
                  Text(leafDiseaseData.name),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(leafDiseaseData),
                  ),
                  );
                },
                label: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
