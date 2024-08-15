import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/widgets/description.dart';
import 'package:artohmapp/presentation/home_page/widgets/featured_artwork.dart';
import 'package:flutter/material.dart';

class FeaturedArtworkDetailsPage extends StatelessWidget {
  final FeaturedArtwork artwork;

  FeaturedArtworkDetailsPage({required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: theme.colorScheme.background,
            expandedHeight: 320.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Container(
                child: Text(
                  artwork.title,
                  style: CustomTextStyles.titleAppBar!
                      .copyWith(color: theme.colorScheme.background),
                ),
              ),
              background: Image.asset(
                artwork.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            artistInfo(),
                          );
                        },
                        child: ListTile(
                          tileColor: theme.colorScheme.surface.withOpacity(.5),
                          title: Text(
                            'Artist',
                            style: CustomTextStyles.titleMedium,
                          ),
                          subtitle: Text(
                            artwork.artist.name,
                            style: CustomTextStyles.bodyLarge,
                          ),
                          trailing: Icon(
                            Icons.info_outline,
                            color: theme.colorScheme.tertiary,
                          ),

                          // },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            artworkInfo(),
                          );
                        },
                        child: ListTile(
                          tileColor: theme.colorScheme.surface.withOpacity(.5),
                          title: Text(
                            'Artwork Details',
                            style: CustomTextStyles.titleMedium,
                          ),
                          trailing: Icon(
                            Icons.info_outline,
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      ),
                      DescriptionTile(description: artwork.description),
                      ListTile(
                        title:
                            Text('Themes', style: CustomTextStyles.titleMedium),
                        subtitle: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: artwork.themes
                              .map((String theme) => Chip(
                                    label: Text(theme),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView artistInfo() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Name: ${artwork.artist.name}'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Birth Year: ${artwork.artist.birthYear}'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Death Year: ${artwork.artist.deathYear}'),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Nationality: ${artwork.artist.nationality}'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Biography: ${artwork.artist.biography}'),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView artworkInfo() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(
                '${artwork.title}',
                style: CustomTextStyles.titleAppBar,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Artist: ${artwork.artist.name}'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Creation Year: ${artwork.year}'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Materials: ${artwork.medium}'),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Period: ${artwork.period}'),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Location: ${artwork.location}'),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Dimension: ${artwork.dimensions}'),
            ),
          ],
        ),
      ),
    );
  }
}
