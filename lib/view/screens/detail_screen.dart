import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/models/leaf.dart';
import 'package:leaf_disease_classification_app/view/components/carousel_widget.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.leafDiseaseData, {super.key});

  LeafDisease leafDiseaseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of Leaf Disease")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselWidget(leafDiseaseData.imageAsset),
              Padding(
                padding: const EdgeInsets.only(top: 32.0).add(EdgeInsets.symmetric(horizontal: 32)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Disease"),
                    Text(
                      leafDiseaseData.name,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        leafDiseaseData.description,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
