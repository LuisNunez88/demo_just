import 'package:flutter/material.dart';

import '../../../../config/extensions/resposive.dart';
import '../../../../domain/entities/competition.dart';
import '../../../global/widgets/animations/fade_in.dart';

/// Represents a tile displaying information about a competition,
/// including its image, name, season, and country.
class CompetitionTile extends StatelessWidget {
  final Competition competition;
  const CompetitionTile({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: context.hp(11),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      competition.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        }
                        return FadeIn(child: child);
                      },
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 2,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(10)),
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10)),
                          color: context.theme.primaryColor,
                        ),
                        child: Image.network(
                          competition.countryImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                ),
                              );
                            }
                            return FadeIn(child: child);
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.wp(5),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    competition.name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: context.hp(1),
                  ),
                  Text(
                    competition.seson,
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: context.hp(1),
                  ),
                ],
              ),
            ),
            Card(
              color: const Color(0xffe9f0ff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  competition.countryName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
