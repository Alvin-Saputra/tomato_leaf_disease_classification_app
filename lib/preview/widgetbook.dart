import 'package:flutter/material.dart';
import 'package:leaf_disease_classification_app/view/components/card_item.dart';
import 'package:leaf_disease_classification_app/view/components/carousel_widget.dart';
import 'package:leaf_disease_classification_app/view/components/result_card.dart';
import 'package:leaf_disease_classification_app/models/leaf.dart';
import 'package:leaf_disease_classification_app/view/screens/detail_screen.dart';
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

   LeafDisease leafData =  LeafDisease(
    id: 'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
    name: 'Yellow Leaf Curl Virus',
    scientificName: 'Illicium verum',
    description:
        'Yellow Leaf Curl Virus disebabkan oleh Tomato Yellow Leaf Curl Virus (TYLCV) dan ditularkan oleh kutu kebul (Bemisia tabaci). Gejalanya meliputi daun yang menguning, melengkung ke atas, dan kerdil. Tanaman terinfeksi juga sering mengalami pertumbuhan terhambat dan penurunan produksi buah. Virus ini menyebar sangat cepat di wilayah beriklim hangat dan tidak ada pengobatan yang efektif. Pengendalian kutu kebul dan penggunaan varietas tahan adalah langkah pencegahan terbaik.',
   
    imageAsset: ["assets/images/yellow_leaf_curl_virus/curly leaf 1.png", "assets/images/yellow_leaf_curl_virus/curly leaf 2.png", "assets/images/yellow_leaf_curl_virus/curly leaf 3.png"],
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
                child: ResultCard(leafData)
              ),
            ),
          ],
        ),

        WidgetbookComponent(
          name: 'Carousel Widget',
          useCases: [
            WidgetbookUseCase(
              name: 'Carousel Widget 1',
              builder: (context) => Center(
                child: CarouselWidget(leafData.imageAsset)
              ),
            ),
          ],
        ),

         WidgetbookComponent(
          name: 'Detail Screen',
          useCases: [
            WidgetbookUseCase(
              name: 'Detail Screen',
              builder: (context) => Center(
                child: DetailScreen(leafData)
              ),
            ),
          ],
        ),
      ],
    );
  }
}
