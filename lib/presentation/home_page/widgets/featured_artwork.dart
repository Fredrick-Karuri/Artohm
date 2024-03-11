import 'dart:async';

import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/home_page/widgets/featured_artwork.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FeaturedArtworkArtist {
  final String name;
  final String birthYear;
  final String deathYear;
  final String nationality;
  final String biography;

  FeaturedArtworkArtist({
    required this.name,
    required this.birthYear,
    required this.deathYear,
    required this.nationality,
    required this.biography,
  });
}

class FeaturedArtwork {
  final String title;
  final FeaturedArtworkArtist artist;
  final String year;
  final String medium;
  final String dimensions;
  final String imageUrl;
  final String description;
  final String
      location; // The museum or collection where the artwork is located
  final String
      period; // The art period or movement the artwork belongs to (e.g., Renaissance, Impressionism)
  final List<String> themes;

  FeaturedArtwork({
    required this.title,
    required this.artist,
    required this.year,
    required this.medium,
    required this.dimensions,
    required this.imageUrl,
    required this.description,
    required this.location,
    required this.period,
    required this.themes,
  });
}

class FeaturedArtworkController extends GetxController {
  int currentIndex = 0;
  var currentArtwork = FeaturedArtwork(
    title: '',
    artist: FeaturedArtworkArtist(
      name: '',
      birthYear: '',
      deathYear: '',
      nationality: '',
      biography: '',
    ),
    year: '',
    medium: '',
    dimensions: '',
    imageUrl: '',
    description: '',
    location: '',
    period: '',
    themes: [],
  ).obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
    currentArtwork.value = featuredArtworks[currentIndex];
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      nextArtwork();
    });
  }

  void nextArtwork() {
    // Increment the current index and loop back to the start if necessary
    currentIndex = (currentIndex + 1) % featuredArtworks.length;
    currentArtwork.value = featuredArtworks[currentIndex];
  }

  void showDetails() {
    // Navigate to the details page

    Get.toNamed(AppRoutes.featuredArtworkDetailsPage,
        arguments: currentArtwork.value);
  }
}

// class FeaturedArtworkView extends StatelessWidget {
//   final FeaturedArtworkController controller =
//       Get.put(FeaturedArtworkController());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<FeaturedArtworkController>(builder: (controller) {
//       return Obx(
//         () => Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
//           child: GestureDetector(
//             onTap: controller.showDetails,
//             child: Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blueGrey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.h),
//                 child: AnimatedOpacity(
//                   opacity: 1.0,
//                   duration: Duration(seconds: 1),
//                   child: AspectRatio(
//                     aspectRatio: 9 / 10,
//                     child: CustomImageView(
//                       imagePath: controller.currentArtwork.value.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

class FeaturedArtworkView extends StatelessWidget {
  final FeaturedArtworkController controller =
      Get.put(FeaturedArtworkController());

  @override
  Widget build(BuildContext context) {
    // return Obx(() {

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 9 / 10,
          // height: 400.0,
          viewportFraction:
              1.0, // This ensures that only one artwork is visible at a time
          autoPlay: true,
          onPageChanged: (index, reason) {
            controller.currentIndex = index;
            controller.currentArtwork.value = featuredArtworks[index];
          },
        ),
        items: featuredArtworks.map((artwork) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: controller.showDetails,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    color: Colors.amber,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.h),
                    child: Image.asset(
                      artwork.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
    // });
  }
}

List<FeaturedArtwork> featuredArtworks = [
  FeaturedArtwork(
    title: 'The Starry Night',
    artist: artistsMap['Vincent van Gogh']!,
    year: '1889',
    medium: 'Oil on canvas',
    dimensions: '74 cm × 92 cm',
    imageUrl: ImageConstant.starryNight,
    description:
        'One of Vincent van Gogh\'s most famous paintings, The Starry Night is a post-Impressionist masterpiece that celebrates the beauty of the night sky.',
    location: 'Museum of Modern Art, New York',
    period: 'Post-Impressionism',
    themes: ['Nature', 'Night', 'Sky'],
  ),
  FeaturedArtwork(
    title: 'The Last Supper',
    artist: artistsMap['Leonardo da Vinci']!,
    year: '1495-1498',
    medium: 'Tempera on gesso, pitch and mastic',
    dimensions: '460 cm × 880 cm',
    imageUrl: ImageConstant.lastSupper,
    description:
        'Painted by Leonardo da Vinci in the early 1500s, The Last Supper is a religious work that depicts the last meal Jesus shared with his twelve apostles before he was betrayed.',
    location: 'Convent of Santa Maria delle Grazie, Milan',
    period: 'High Renaissance',
    themes: ['Religion', 'Apostles', 'Jesus'],
  ),
  FeaturedArtwork(
    title: 'The Scream',
    artist: artistsMap['Edvard Munch']!,
    year: '1893',
    medium: 'Oil, tempera, pastel and crayon on cardboard',
    dimensions: '91 cm × 73.5 cm',
    imageUrl: ImageConstant.theScream,
    description:
        'Created by the Norwegian artist Edvard Munch, The Scream is a powerful and influential work that is known for its expressive brushstrokes and raw emotion.',
    location: 'National Gallery, Oslo, Norway',
    period: 'Expressionism',
    themes: ['Anxiety', 'Despair'],
  ),
  FeaturedArtwork(
    title: 'Mona Lisa',
    artist: artistsMap['Leonardo da Vinci']!,
    year: '1503-1506',
    medium: 'Oil on poplar',
    dimensions: '77 cm × 53 cm',
    imageUrl: ImageConstant.monaLisa,
    description:
        'Painted by Leonardo da Vinci in the early 16th century, The Mona Lisa is one of the most famous paintings in the world. It is known for its enigmatic smile and the incomplete painting style that adds to its mystery.',
    location: 'Louvre Museum, Paris',
    period: 'High Renaissance',
    themes: ['Portrait', 'Mystery'],
  ),
  FeaturedArtwork(
    title: 'The Persistence of Memory',
    artist: artistsMap['Salvador Dalí']!,
    year: '1931',
    medium: 'Oil on canvas',
    dimensions: '24 cm × 33 cm',
    imageUrl: ImageConstant.imgRectangle11400x3401,
    description:
        'Created by the Spanish surrealist artist Salvador Dalí, The Persistence of Memory is a dreamlike painting that depicts melting clocks and other surrealist symbols. It is known for its strange and intriguing imagery.',
    location: 'Museum of Modern Art, New York',
    period: 'Surrealism',
    themes: ['Time', 'Memory', 'Surreal'],
  ),
  FeaturedArtwork(
    title: 'Guernica',
    artist: artistsMap['Pablo Picasso']!,
    year: '1937',
    medium: 'Oil on canvas',
    dimensions: '349 cm × 776 cm',
    imageUrl: ImageConstant.guernica,
    description:
        'Painted by the Spanish artist Pablo Picasso in the midst of the Spanish Civil War, Guernica is a powerful anti-war statement. It is considered one of Picasso\'s greatest works and is now in the public domain.',
    location: 'Museo Reina Sofia, Madrid',
    period: 'Cubism',
    themes: ['War', 'Suffering', 'Peace'],
  ),
  FeaturedArtwork(
    title: 'The Great Wave off Kanagawa',
    artist: artistsMap['Hokusai']!,
    year: '1832',
    medium: 'Woodblock print',
    dimensions: '25.7 cm × 37.8 cm',
    imageUrl: ImageConstant.theGreatWave,
    description:
        'Painted by the Japanese ukiyo-e artist Hokusai, The Great Wave off Kanagawa is a beautiful representation of a powerful and ever-changing natural phenomenon. It is a popular work that is widely admired for its technique and emotional impact.',
    location: 'Various collections',
    period: 'Edo period',
    themes: ['Nature', 'Sea', 'Wave'],
  ),
];

Map<String, FeaturedArtworkArtist> artistsMap = {
  for (var artist in artists) artist.name: artist
};

List<FeaturedArtworkArtist> artists = [
  FeaturedArtworkArtist(
    name: 'Vincent van Gogh',
    birthYear: '1853',
    deathYear: '1890',
    nationality: 'Dutch',
    biography:
        'Vincent Willem van Gogh was a Dutch post-impressionist painter who is among the most famous and influential figures in the history of Western art.',
  ),
  FeaturedArtworkArtist(
    name: 'Leonardo da Vinci',
    birthYear: '1452',
    deathYear: '1519',
    nationality: 'Italian',
    biography:
        'Leonardo di ser Piero da Vinci was an Italian polymath of the High Renaissance who is widely considered one of the most diversely talented individuals ever to have lived.',
  ),
  FeaturedArtworkArtist(
    name: 'Edvard Munch',
    birthYear: '1863',
    deathYear: '1944',
    nationality: 'Norwegian',
    biography:
        'Edvard Munch was a Norwegian painter. His best-known work, The Scream, has become one of Western art\'s iconic images.',
  ),
  FeaturedArtworkArtist(
    name: 'Salvador Dalí',
    birthYear: '1904',
    deathYear: '1989',
    nationality: 'Spanish',
    biography:
        'Salvador Domingo Felipe Jacinto Dalí i Domènech, 1st Marquess of Dalí de Púbol was a Spanish surrealist artist renowned for his technical skill, precise draftsmanship and the striking and bizarre images in his work.',
  ),
  FeaturedArtworkArtist(
    name: 'Pablo Picasso',
    birthYear: '1881',
    deathYear: '1973',
    nationality: 'Spanish',
    biography:
        'Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist and theatre designer who spent most of his adult life in France. Regarded as one of the most influential artists of the 20th century, he is known for co-founding the Cubist movement, the invention of constructed sculpture, the co-invention of collage, and for the wide variety of styles that he helped develop and explore.',
  ),
  FeaturedArtworkArtist(
    name: 'Hokusai',
    birthYear: '1760',
    deathYear: '1849',
    nationality: 'Japanese',
    biography:
        'Katsushika Hokusai was a Japanese artist, ukiyo-e painter and printmaker of the Edo period. Hokusai is best known for the woodblock print series Thirty-Six Views of Mount Fuji which includes the internationally iconic print, The Great Wave off Kanagawa.',
  ),
];
