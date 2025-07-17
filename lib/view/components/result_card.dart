import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/plant.png", height: 75, width: 75),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Disease", style: TextStyle(fontSize: 12)),
                  Text("Curly Yellow"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
