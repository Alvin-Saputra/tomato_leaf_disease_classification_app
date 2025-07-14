import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/view/components/card.dart';
import 'package:leaf_disease_classification_app/view/models/leaf.dart';

class LeafDiseaseListScreen extends StatelessWidget {
  LeafDiseaseListScreen({super.key});

  List<LeafDisease> leafDiseaseData = listLeafDisease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LeafDisease"),),
      body: ListView.builder(
        itemCount: leafDiseaseData.length,
        itemBuilder: (context, index) {
          return CardItem(leafData: listLeafDisease[index]);
        },
      ),
    );
  }
}