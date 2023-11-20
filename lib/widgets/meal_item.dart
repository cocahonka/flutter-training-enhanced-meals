import 'package:flutter/material.dart';
import 'package:meals_enhanced/extensions/capitalize.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/screens/meal_details_screen.dart';
import 'package:meals_enhanced/widgets/meal_item_brief_summary_item.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder<void>(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (_, __, ___) {
                return MealDetailsScreen(meal: meal);
              },
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Hero(
                tag: meal.hashCode,
                flightShuttleBuilder: (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  final edgeAnimation = Tween<double>(begin: 0, end: 90).animate(animation);

                  return AnimatedBuilder(
                    animation: edgeAnimation,
                    builder: (context, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(edgeAnimation.value),
                          bottomRight: Radius.circular(edgeAnimation.value),
                        ),
                        child: child,
                      );
                    },
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: meal.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: meal.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ColoredBox(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          meal.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemBriefSummaryItem(
                              icon: Icons.timer_outlined,
                              text: '${meal.duration.inMinutes} min',
                            ),
                            MealItemBriefSummaryItem(
                              icon: Icons.work,
                              text: meal.complexity.name.capitalize(),
                            ),
                            MealItemBriefSummaryItem(
                              icon: Icons.attach_money,
                              text: meal.affordability.name.capitalize(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
