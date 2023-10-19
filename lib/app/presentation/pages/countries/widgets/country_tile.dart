import 'package:flutter/material.dart';

import '../../../../config/extensions/resposive.dart';
import '../../../../domain/entities/country.dart';
import '../../../global/widgets/animations/fade_in.dart';

/// Displays a card with an image and name of a country, and can be
/// tapped to trigger an `onPressed` function.
class CountryTile extends StatelessWidget {
  final Country country;
  final Function()? onPressed;
  const CountryTile({super.key, required this.country, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: context.hp(27),
        width: context.isPhone ? context.wp(38) : 200,
        margin: const EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    country.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      }
                      return FadeIn(child: child);
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.hp(2),
              ),
              Text(
                country.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: context.hp(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
