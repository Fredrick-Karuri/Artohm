import 'dart:async';
import 'package:artohmapp/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  void pauseTimer() {
    _timer?.cancel();
  }

  void resumeTimer() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 6), (timer) {
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
              controller
                  .pauseTimer(); //pause the  timer when the user states scrolling
              controller.currentIndex = index;
              controller.currentArtwork.value = featuredArtworks[index];
            },
            onScrolled: (value) {
              if (value == 0 || value == 1) {
                controller
                    .resumeTimer(); //resume the timer when the user stops scrolling
              }
            }),
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
        ' The Starry Night is an oil-on-canvas painting by the Dutch Post-Impressionist painter Vincent van Gogh. Painted in June 1889, it depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence, just before sunrise, with the addition of an imaginary village. It has been in the permanent collection of the Museum of Modern Art in New York City since 1941. Widely regarded as Van Gogh’s magnum opus, The Starry Night is one of the most recognizable paintings in Western art.It is one of the most well-known paintings of the Impressionist style.',
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
        'The Last Supper is a mural painting by the Italian High Renaissance artist Leonardo da Vinci, dated to c. 1495–1498, housed in the refectory of the Convent of Santa Maria delle Grazie in Milan, Italy. The painting represents the scene of the Last Supper of Jesus with the Twelve Apostles, as it is told in the Gospel of John – specifically the moment after Jesus announces that one of his apostles will betray him. Its handling of space, mastery of perspective, treatment of motion and complex display of human emotion has made it one of the Western world’s most recognizable paintings and among Leonardo’s most celebrated works.I',
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
        'The Scream is a composition created by Norwegian artist Edvard Munch in 1893. The agonized face in the painting has become one of the most iconic images in art, seen as symbolizing the anxiety of the human condition. Munch’s work, including The Scream, had a formative influence on the Expressionist movement. Munch recalled that he had been out for a walk at sunset when suddenly the setting sun’s light turned the clouds “a blood red”. He sensed an “infinite scream passing through nature”. Scholars have located the spot to a fjord overlooking Oslo and have suggested other explanations for the unnaturally orange sky, ranging from the effects of a volcanic eruption to a psychological reaction by Munch to his sister’s commitment at a nearby lunatic asylum.',
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
