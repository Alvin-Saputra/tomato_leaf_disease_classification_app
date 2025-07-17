import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/view/components/card_item.dart';
import 'package:leaf_disease_classification_app/view/components/result_card.dart';
import 'package:leaf_disease_classification_app/view/models/leaf.dart';
import 'package:leaf_disease_classification_app/view/screens/leaf_disease_list_screen.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.greenAccent,
    foregroundColor: Colors.white,
  ),
);

class HotReload extends StatelessWidget {
  HotReload({Key? key}) : super(key: key);

   LeafDisease leafData = LeafDisease(
    name: 'Yellow Leaf Curl Virus',
    scientificName: 'Illicium verum',
    description:
        'Bunga lawang atau star anise adalah Leaf yang berasal dari buah pohon yang tumbuh di Asia dan Australia. Bentuknya seperti bintang dengan kelopak yang mengandung biji.',
   
    imageAsset: "assets/images/plant.png",
  );

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light Theme', // Nama yang akan muncul di UI Widgetbook
              data: lightTheme,
            ),
          ],
        ),
        // Anda bisa menambahkan addon lain di sini jika perlu
        // Contoh: DeviceFrameAddon.new, TextScaleAddon.new, dll.
      ],
      directories: [
        WidgetbookComponent(
          name: 'Card Item',
          useCases: [
            WidgetbookUseCase(
              name: 'Card Item Components',
              builder: (context) => Center(
                child: CardItem(leafData: leafData,)
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'List of Leaf Disease Screen',
          useCases: [
            WidgetbookUseCase(
              name: 'List of Leaf Disease Screen',
              builder: (context) => Center(
                child: LeafDiseaseListScreen()
              ),
            ),
          ],
        ),

         WidgetbookComponent(
          name: 'Result Card',
          useCases: [
            WidgetbookUseCase(
              name: 'Result Card',
              builder: (context) => Center(
                child: ResultCard()
              ),
            ),
          ],
        ),
      ],
    );
  }
}
