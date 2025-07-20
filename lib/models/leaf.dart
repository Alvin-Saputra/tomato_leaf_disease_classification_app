class LeafDisease {
  String id;
  String name;
  String scientificName;
  String description;
  List<String> imageAsset;

  LeafDisease({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageAsset,
  });
}

var listLeafDisease = [
  LeafDisease(
    id: 'Tomato___Bacterial_spot',
    name: 'Bacterial Spot',
    scientificName: 'Illicium verum',
    description:
        'Bacterial Spot is a disease caused by the bacterium Xanthomonas campestris pv. vesicatoria. It commonly affects the leaves, stems, and fruits of tomato plants. The main symptom is the appearance of small, dark brown to black spots with yellow halos that can merge and cause tissue damage. In humid conditions, this disease spreads rapidly, often leading to premature leaf drop and reduced yields. Prevention includes using disease-free seeds, crop rotation, and maintaining field sanitation.',

    imageAsset: [
      "assets/images/bacterial_spot/bacterial spot 1.png",
      "assets/images/bacterial_spot/bacterial spot 2.png",
      "assets/images/bacterial_spot/bacterial spot 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Early_blight',
    name: 'Early Blight',
    scientificName: 'Illicium verum',
    description:
        'Early Blight is caused by the fungus Alternaria solani and commonly affects tomatoes and potatoes. It typically starts on the lower leaves with dark brown spots that have concentric rings, resembling a target. Over time, these spots enlarge and spread to upper leaves. Severe infections cause yellowing and defoliation, reducing both the quality and quantity of harvest. Warm, humid conditions accelerate its spread. Prevention includes crop rotation, fungicide application, and ensuring good air circulation.',

    imageAsset: [
      "assets/images/early_late_blight/early_late blight 1.png",
      "assets/images/early_late_blight/early_late blight 2.png",
      "assets/images/early_late_blight/early_late blight 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___healthy',
    name: 'Healthy',
    scientificName: 'Illicium verum',
    description:
        'Healthy leaves are a key indicator of optimal plant growth. A healthy tomato leaf is bright green, smooth in texture, and free from spots, curling, or discoloration. Healthy plants exhibit strong growth, firm stems, and proper flower and fruit development. Proper care, including regular watering, balanced fertilization, adequate sunlight, and pest and disease control, is essential to maintaining leaf health throughout the growing season.',

    imageAsset: [
      "assets/images/healthy/healthy 1.png",
      "assets/images/healthy/healthy 2.png",
      "assets/images/healthy/healthy 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Late_blight',
    name: 'Late Blight',
    scientificName: 'Illicium verum',
    description:
        'Late Blight is one of the most destructive diseases of tomatoes and potatoes, caused by the pathogen Phytophthora infestans. It starts with water-soaked lesions on leaf edges that turn brown or black and spread rapidly. In humid weather, white spores may form on the underside of leaves. A severe outbreak can destroy an entire plant within days. Control measures include planting resistant varieties, applying fungicides, and managing humidity levels in the field.',

    imageAsset: [
      "assets/images/early_late_blight/early_late blight 1.png",
      "assets/images/early_late_blight/early_late blight 2.png",
      "assets/images/early_late_blight/early_late blight 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Leaf_Mold',
    name: 'Leaf Mold',
    scientificName: 'Illicium verum',
    description:
        'Leaf Mold is caused by the fungus Passalora fulva (formerly Fulvia fulva) and affects tomato leaves, especially in humid conditions with poor ventilation. Initial symptoms appear as pale yellow spots on the upper surface of leaves, followed by olive-green to brown velvety mold on the undersides. If left untreated, leaves dry out, curl, and eventually fall off. While it rarely affects the fruit directly, it significantly reduces photosynthesis and plant productivity.',

    imageAsset: [
      "assets/images/leaf_mold/leaf mold 1.png",
      "assets/images/leaf_mold/leaf mold 2.png",
      "assets/images/leaf_mold/leaf mold 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Septoria_leaf_spot',
    name: 'Septoria Leaf Spot',
    scientificName: 'Illicium verum',
    description:
        'Septoria Leaf Spot is caused by the fungus Septoria lycopersici and typically affects older leaves near the bottom of the plant. It presents as small, circular gray to brown spots with dark borders. Tiny black dots (fungal fruiting bodies) are often visible in the center of the spots. Without control, the disease spreads upward, causing defoliation and yield loss. It spreads through water splashes and rain. Prevention includes plant spacing, pruning infected leaves, and applying fungicides.',

    imageAsset: [
      "assets/images/septoria_leaf_spot/septoria leaf spot 1.png",
      "assets/images/septoria_leaf_spot/septoria leaf spot 2.png",
      "assets/images/septoria_leaf_spot/septoria leaf spot 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Spider_mites Two-spotted_spider_mite',
    name: 'Spider Mites',
    scientificName: 'Illicium verum',
    description:
        'Spider Mites, especially the two-spotted spider mite (Tetranychus urticae), are tiny pests that suck sap from leaves, causing small yellow or white speckles. Severe infestations lead to leaf discoloration, drying, and eventual drop. Fine webbing is often seen on the undersides of leaves. These pests thrive in hot, dry conditions. Prevention includes maintaining humidity, washing leaves with water, or applying natural insecticides such as neem oil.',

    imageAsset: [
      "assets/images/spider_mites/spidermites 1.png",
      "assets/images/spider_mites/spidermites 2.png",
      "assets/images/spider_mites/spidermites 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Target_Spot',
    name: 'Target Spot',
    scientificName: 'Illicium verum',
    description:
        'Target Spot is a fungal disease caused by Corynespora cassiicola. It is characterized by round brown lesions with concentric rings, resembling a target. These lesions can merge, leading to large areas of necrosis on the leaves. In severe cases, infected leaves turn yellow, curl, and fall off. The disease spreads through wind and splashing water, especially during the rainy season. Management includes crop rotation, removing lower leaves, and regular fungicide use.',

    imageAsset: [
      "assets/images/target_spot/target spot 1.png",
      "assets/images/target_spot/target spot 2.png",
      "assets/images/target_spot/target spot 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Tomato_mosaic_virus',
    name: 'Mosaic Virus',
    scientificName: 'Illicium verum',
    description:
        'Mosaic Virus, including Tomato Mosaic Virus (ToMV), causes a mosaic pattern of irregular light and dark green spots on the leaves. Leaves may become curled, wrinkled, and plant growth becomes stunted. This disease is highly contagious and spreads through human contact, gardening tools, or infected seeds. There is no cure for this virus, so prevention is key. Use healthy seeds, avoid contact between infected plants, and regularly sterilize gardening tools.',

    imageAsset: [
      "assets/images/mosaic_virus/mosaic virus 1.png",
      "assets/images/mosaic_virus/mosaic virus 2.png",
      "assets/images/mosaic_virus/mosaic virus 3.png",
    ],
  ),

  LeafDisease(
    id: 'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
    name: 'Yellow Leaf Curl Virus',
    scientificName: 'Illicium verum',
    description:
        'Yellow Leaf Curl Virus is caused by the Tomato Yellow Leaf Curl Virus (TYLCV) and is transmitted by whiteflies (Bemisia tabaci). Symptoms include yellowing leaves, upward leaf curling, and stunted growth. Infected plants often experience inhibited growth and reduced fruit production. This virus spreads rapidly in warm climates and there is no effective treatment. Controlling whiteflies and using resistant varieties are the best preventive measures.',

    imageAsset: [
      "assets/images/yellow_leaf_curl_virus/curly leaf 1.png",
      "assets/images/yellow_leaf_curl_virus/curly leaf 2.png",
      "assets/images/yellow_leaf_curl_virus/curly leaf 3.png",
    ],
  ),
];
