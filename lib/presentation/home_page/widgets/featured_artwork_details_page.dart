import 'package:artohmapp/core/app_export.dart';
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
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                artwork.title,
                style: CustomTextStyles.titleAppBar,
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
                InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      artistInfo(),
                    );
                  },
                  child: ListTile(
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
                    ),

                    // },
                  ),
                ),
                ListTile(
                  title: Text('Year', style: CustomTextStyles.titleMedium),
                  subtitle:
                      Text(artwork.year, style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title: Text('Medium', style: CustomTextStyles.titleMedium),
                  subtitle:
                      Text(artwork.medium, style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title: Text(
                    'Dimensions',
                    style: CustomTextStyles.titleMedium,
                  ),
                  subtitle: Text(artwork.dimensions,
                      style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title:
                      Text('Description', style: CustomTextStyles.titleMedium),
                  subtitle: Text(artwork.description,
                      style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title:
                      Text('Description', style: CustomTextStyles.titleMedium),
                  subtitle: Text(artwork.description,
                      style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title:
                      Text('Description', style: CustomTextStyles.titleMedium),
                  subtitle: Text(artwork.description,
                      style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title:
                      Text('Description', style: CustomTextStyles.titleMedium),
                  subtitle: Text(artwork.description,
                      style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title: Text('Location', style: CustomTextStyles.titleMedium),
                  subtitle: Text(artwork.location),
                ),
                ListTile(
                  title: Text('Period', style: CustomTextStyles.titleMedium),
                  subtitle:
                      Text(artwork.period, style: CustomTextStyles.bodyLarge),
                ),
                ListTile(
                  title: Text('Themes', style: CustomTextStyles.titleMedium),
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
}
