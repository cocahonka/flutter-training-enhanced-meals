// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:meals_enhanced/models/affordability.dart';
import 'package:meals_enhanced/models/complexity.dart';
import 'package:meals_enhanced/models/filters.dart';
import 'package:meals_enhanced/models/meal.dart';
import 'package:meals_enhanced/scopes/filters_scope.dart';

@immutable
class MealsScope extends StatefulWidget {
  const MealsScope({required this.child, super.key});

  final Widget child;

  static List<Meal> watch(BuildContext context) => context.dependOnInheritedWidgetOfExactType<_MealsInherited>()!.meals;

  @override
  State<MealsScope> createState() => _MealsScopeState();
}

class _MealsScopeState extends State<MealsScope> {
  final List<Meal> _meals = const [
    Meal(
      name: 'Spaghetti Carbonara',
      imageUrl:
          'https://static01.nyt.com/images/2021/02/14/dining/carbonara-horizontal/carbonara-horizontal-threeByTwoMediumAt2X-v2.jpg',
      duration: Duration(minutes: 30),
      complexity: Complexity.moderate,
      affordability: Affordability.affordable,
      ingredients: ['Spaghetti', 'Bacon', 'Eggs', 'Parmesan Cheese'],
      steps: [
        "Boil water in a large pot, add salt once it's boiling, and cook spaghetti until al dente.",
        "Meanwhile, cut the bacon into small pieces and fry it until it's crispy. Set aside.",
        'In a bowl, whisk together eggs and grated Parmesan cheese until well combined.',
        'Drain the spaghetti, reserving some pasta water, and quickly mix it with the egg and cheese mixture. Add bacon.',
        'Serve immediately, garnished with extra Parmesan and freshly ground black pepper.',
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c1', 'c2'],
    ),
    Meal(
      name: 'Vegan Salad',
      imageUrl: 'https://mindfulavocado.com/wp-content/uploads/2019/01/Hippie-Salad_008.jpg',
      duration: Duration(minutes: 15),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Lettuce', 'Tomatoes', 'Cucumbers', 'Olive oil'],
      steps: [
        'Wash and chop lettuce, tomatoes, and cucumbers into bite-sized pieces.',
        'In a large salad bowl, combine all chopped vegetables.',
        'Drizzle with olive oil and your choice of vinegar or lemon juice. Toss well to coat.',
        'Season with salt, pepper, and any other salad seasonings you prefer.',
        'Serve fresh as a light and healthy meal option.'
      ],
      isGlutenFree: true,
      isLactoseFree: true,
      isVegeterian: true,
      isVegan: true,
      categories: ['c5', 'c10'],
    ),
    Meal(
      name: 'Classic Hamburger',
      imageUrl:
          'https://assets.biggreenegg.eu/app/uploads/2019/03/28145521/topimage-classic-hamburger-2019m04-800x534.jpg',
      duration: Duration(minutes: 25),
      complexity: Complexity.moderate,
      affordability: Affordability.pricey,
      ingredients: ['Ground beef', 'Burger buns', 'Lettuce', 'Tomato', 'Cheese', 'Onion', 'Pickles'],
      steps: [
        'Form ground beef into patties and season with salt and pepper.',
        'Preheat a grill or skillet over medium-high heat. Cook the patties for about 4 minutes on each side for medium doneness.',
        'While the burgers are cooking, toast the buns lightly on the grill or in a toaster.',
        'Once cooked, place a slice of cheese on each patty and let it melt.',
        'Assemble the burgers by placing lettuce, tomato slices, and the cooked patty on the bun. Add onions and pickles as desired.',
        'Serve with ketchup, mustard, or your favorite burger sauce.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c3'],
    ),
    Meal(
      name: 'German Sausage and Sauerkraut',
      imageUrl:
          'https://theviewfromgreatisland.com/wp-content/uploads/2021/09/baked-brats-in-sauerkraut-7810-September-04-2021.jpg',
      duration: Duration(minutes: 45),
      complexity: Complexity.moderate,
      affordability: Affordability.pricey,
      ingredients: ['German sausage', 'Sauerkraut', 'Onions', 'Apples', 'Potatoes', 'Beer'],
      steps: [
        'In a large skillet, cook the sausages over medium heat until browned and cooked through. Remove and set aside.',
        'In the same skillet, sauté sliced onions and apples until the onions are translucent.',
        'Add the sauerkraut to the skillet and mix well. Pour in a cup of beer and bring to a simmer.',
        'Cut the cooked sausages into pieces and add them back to the skillet. Cover and let simmer for about 20 minutes.',
        'Serve with boiled or mashed potatoes on the side.'
      ],
      isGlutenFree: false,
      isLactoseFree: true,
      isVegeterian: false,
      isVegan: false,
      categories: ['c4'],
    ),
    Meal(
      name: 'Pad Thai',
      imageUrl: 'https://www.recipetineats.com/wp-content/uploads/2020/01/Chicken-Pad-Thai_9-SQ.jpg',
      duration: Duration(minutes: 30),
      complexity: Complexity.complex,
      affordability: Affordability.pricey,
      ingredients: ['Rice noodles', 'Shrimp', 'Eggs', 'Bean sprouts', 'Peanuts', 'Lime', 'Pad Thai sauce'],
      steps: [
        'Soak rice noodles in warm water for about 20 minutes until soft. Drain and set aside.',
        'In a large wok, fry the shrimp until just cooked. Remove and set aside.',
        'Scramble the eggs in the wok, then add the drained noodles and Pad Thai sauce. Stir fry until everything is well coated.',
        'Add the cooked shrimp back to the wok along with bean sprouts and chopped peanuts.',
        'Serve hot, garnished with lime wedges and extra peanuts.'
      ],
      isGlutenFree: true,
      isLactoseFree: true,
      isVegeterian: false,
      isVegan: false,
      categories: ['c8'],
    ),
    Meal(
      name: 'French Onion Soup',
      imageUrl: 'https://www.wellplated.com/wp-content/uploads/2023/01/French-Onion-Soup-Recipe-e1673300838182.jpg',
      duration: Duration(minutes: 60),
      complexity: Complexity.moderate,
      affordability: Affordability.pricey,
      ingredients: ['Onions', 'Beef broth', 'Baguette', 'Gruyere cheese', 'Butter', 'Thyme'],
      steps: [
        'Thinly slice the onions and cook them slowly in melted butter until caramelized, which may take around 30 minutes.',
        'Add beef broth and thyme to the caramelized onions, and bring to a simmer for about 15 minutes.',
        'Toast slices of baguette and set aside.',
        'Ladle the soup into oven-safe bowls, place the toasted baguette on top, and cover with Gruyere cheese.',
        'Broil in the oven until the cheese is bubbly and golden brown. Serve hot.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Breakfast Burrito',
      imageUrl: 'https://www.onceuponachef.com/images/2018/03/Breakfast-Burritos.jpg',
      duration: Duration(minutes: 20),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Tortillas', 'Eggs', 'Cheese', 'Sausage', 'Peppers', 'Onions'],
      steps: [
        'Scramble the eggs in a pan and set them aside.',
        'Cook the sausage with chopped peppers and onions until the sausage is browned and the vegetables are soft.',
        'Warm the tortillas on a skillet or in the microwave.',
        'Assemble the burrito by placing scrambled eggs, sausage mixture, and shredded cheese on each tortilla.',
        'Roll up the tortillas, folding in the sides, and then cook on a skillet until each side is golden brown.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c7'],
    ),
    Meal(
      name: 'Mango Sticky Rice',
      imageUrl:
          'https://takestwoeggs.com/wp-content/uploads/2021/07/Thai-Mango-Sticky-Rice-Takestwoeggs-Process-Final-sq.jpg',
      duration: Duration(minutes: 50),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Sticky rice', 'Mango', 'Coconut milk', 'Sugar', 'Salt'],
      steps: [
        'Soak sticky rice in water for at least 30 minutes, then steam until tender.',
        'In a separate pot, mix coconut milk with sugar and salt, and warm it up without boiling.',
        'Mix the cooked rice with the warm coconut milk and let it absorb for about 15 minutes.',
        'Peel and slice the mango.',
        'Serve the sticky rice with fresh mango slices on top.'
      ],
      isGlutenFree: true,
      isLactoseFree: true,
      isVegeterian: true,
      isVegan: true,
      categories: ['c6', 'c10'],
    ),
    Meal(
      name: 'Lobster Thermidor',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/48/Lobster_Thermidor_entree.jpg',
      duration: Duration(minutes: 60),
      complexity: Complexity.complex,
      affordability: Affordability.luxurious,
      ingredients: ['Lobster', 'Heavy cream', 'Butter', 'Mustard', 'Brandy', 'Parmesan cheese'],
      steps: [
        'Boil the lobster, then remove the meat from the shell and cut it into pieces.',
        'In a pan, melt butter and add a bit of flour to make a roux. Gradually add cream, mustard, and a splash of brandy.',
        'Add the lobster meat to the sauce and heat through.',
        'Place the mixture back into the lobster shell, sprinkle with Parmesan cheese, and broil until golden.',
        'Serve with a side of steamed vegetables or a fresh salad.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Beef Wellington',
      imageUrl: 'https://www.justspices.co.uk/media/recipe/Meat_and_Roast_Seasoning_Beef_Wellington-5.png',
      duration: Duration(minutes: 90),
      complexity: Complexity.complex,
      affordability: Affordability.luxurious,
      ingredients: ['Beef tenderloin', 'Mushrooms', 'Puff pastry', 'Egg yolk', 'Prosciutto', 'Dijon mustard'],
      steps: [
        'Season the beef tenderloin and sear it on all sides. Let it cool and then brush with Dijon mustard.',
        'Chop mushrooms finely and sauté in butter until all moisture evaporates.',
        'Wrap the beef in prosciutto and the mushroom mixture, then encase it in puff pastry.',
        'Brush the pastry with beaten egg yolk and bake until the pastry is golden.',
        'Allow to rest before slicing. Serve with a rich sauce like a red wine reduction.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Truffle Risotto',
      imageUrl: 'https://www.idratherbeachef.com/wp-content/uploads/2017/03/truffle-risotto-featured.jpg',
      duration: Duration(minutes: 50),
      complexity: Complexity.moderate,
      affordability: Affordability.luxurious,
      ingredients: ['Arborio rice', 'Truffles', 'Chicken stock', 'Parmesan cheese', 'Butter', 'White wine'],
      steps: [
        'In a pan, heat some butter and cook the Arborio rice until translucent.',
        'Gradually add warm chicken stock, stirring constantly, until the rice is creamy and al dente.',
        'Stir in grated Parmesan cheese and a generous amount of shaved truffles.',
        'Finish with a splash of white wine, and adjust seasoning with salt and pepper.',
        'Serve hot, garnished with more truffle shavings and a drizzle of truffle oil.'
      ],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Seared Scallops',
      imageUrl:
          'https://www.sprinklesandsprouts.com/wp-content/uploads/2017/11/Pan-Seared-Scallops-with-creamy-Saffron-sauce.jpg',
      duration: Duration(minutes: 35),
      complexity: Complexity.moderate,
      affordability: Affordability.luxurious,
      ingredients: ['Scallops', 'Butter', 'White wine', 'Heavy cream', 'Saffron', 'Lemon'],
      steps: [
        'Pat the scallops dry and season with salt and pepper.',
        'Heat butter in a pan over high heat and sear the scallops for about 1-2 minutes on each side until golden brown.',
        'Remove the scallops and deglaze the pan with white wine. Add a pinch of saffron threads and let it simmer.',
        'Stir in heavy cream and reduce the sauce until it thickens slightly.',
        'Serve the scallops with the saffron sauce and a squeeze of fresh lemon juice.'
      ],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Duck Confit with Cherry Sauce',
      imageUrl:
          'https://img.taste.com.au/k3It6SDd/taste/2016/11/duck-confit-with-sour-cherry-sauce-and-apple-fennel-and-walnut-salad-32835-1.jpeg',
      duration: Duration(hours: 4, minutes: 30), // Including marinating time
      complexity: Complexity.complex,
      affordability: Affordability.luxurious,
      ingredients: ['Duck legs', 'Duck fat', 'Cherries', 'Red wine', 'Sugar', 'Thyme'],
      steps: [
        'Season duck legs with salt and thyme, and let them marinate overnight.',
        'Slow cook the duck legs in duck fat at a low temperature for several hours until tender.',
        'For the sauce, simmer cherries in red wine and sugar until it forms a syrupy consistency.',
        'Crisp up the duck legs in a hot oven or pan before serving.',
        'Serve the duck confit with the cherry sauce drizzled over the top.'
      ],
      isGlutenFree: true,
      isLactoseFree: true,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Caviar and Blini',
      imageUrl: 'https://themaplecuttingboard.com/wp-content/uploads/2020/04/Caviar.jpg',
      duration: Duration(minutes: 60),
      complexity: Complexity.moderate,
      affordability: Affordability.luxurious,
      ingredients: ['Caviar', 'Blini (small pancakes)', 'Sour cream', 'Chopped onions', 'Chopped eggs'],
      steps: [
        'Prepare blini according to a traditional recipe, or use ready-made ones.',
        'Serve the blini warm with a dollop of sour cream.',
        'Top each blini with a small spoonful of caviar.',
        'Garnish with finely chopped onions and hard-boiled eggs.',
        'Arrange on a platter and serve as an elegant appetizer.'
      ],
      isGlutenFree: false,
      isLactoseFree: false,
      isVegeterian: false,
      isVegan: false,
      categories: ['c9'],
    ),
    Meal(
      name: 'Chicken Stir Fry',
      imageUrl: 'https://www.wellplated.com/wp-content/uploads/2019/07/Ginger-Teriyaki-Chicken-Stir-Fry.jpg',
      duration: Duration(minutes: 20),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Chicken breast', 'Bell peppers', 'Broccoli', 'Soy sauce', 'Ginger', 'Garlic'],
      steps: [
        'Cut the chicken breast into small pieces and season with salt and pepper.',
        "Heat a bit of oil in a wok or large pan and cook the chicken until it's no longer pink inside.",
        'Add chopped bell peppers and broccoli to the pan and stir fry for a few minutes.',
        'Mix in minced ginger and garlic, then pour in soy sauce and stir until everything is well coated.',
        'Serve hot, optionally with rice or noodles.'
      ],
      isGlutenFree: false,
      isLactoseFree: true,
      isVegeterian: false,
      isVegan: false,
      categories: ['c2', 'c8'],
    ),
    Meal(
      name: 'Caprese Salad',
      imageUrl: 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2019/07/Caprese-Salad-main-1.jpg',
      duration: Duration(minutes: 10),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Fresh mozzarella', 'Tomatoes', 'Basil', 'Olive oil', 'Balsamic vinegar'],
      steps: [
        'Slice fresh mozzarella and tomatoes and arrange them on a plate, alternating slices.',
        'Scatter fresh basil leaves over the top.',
        'Drizzle with olive oil and balsamic vinegar.',
        'Season with salt and pepper to taste.',
        'Serve as a refreshing starter or a light meal.'
      ],
      isGlutenFree: true,
      isLactoseFree: false,
      isVegeterian: true,
      isVegan: false,
      categories: ['c2', 'c5', 'c10'],
    ),
    Meal(
      name: 'Avocado Toast',
      imageUrl: 'https://weekendatthecottage.com/wp-content/uploads/2016/10/AvocadoToast5.jpg',
      duration: Duration(minutes: 15),
      complexity: Complexity.simple,
      affordability: Affordability.affordable,
      ingredients: ['Bread', 'Avocado', 'Eggs', 'Lemon juice', 'Chili flakes'],
      steps: [
        'Toast slices of bread until golden brown.',
        'Mash ripe avocado and mix in a bit of lemon juice, salt, and pepper.',
        'Spread the mashed avocado generously on the toasted bread.',
        'Top with a fried or poached egg and sprinkle with chili flakes.',
        'Serve immediately for a quick and nutritious breakfast or snack.'
      ],
      isGlutenFree: false,
      isLactoseFree: true,
      isVegeterian: true,
      isVegan: false,
      categories: ['c2', 'c7'],
    ),
  ];
  late Filters _filters;

  @override
  void didChangeDependencies() {
    _filters = FiltersScope.watch(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _MealsInherited(
      meals: _meals.where((meal) {
        if (!meal.isGlutenFree && _filters.isGlutenFree) return false;
        if (!meal.isLactoseFree && _filters.isLactoseFree) return false;
        if (!meal.isVegeterian && _filters.isVegeterian) return false;
        if (!meal.isVegan && _filters.isVegan) return false;
        return true;
      }).toList(),
      child: widget.child,
    );
  }
}

@immutable
class _MealsInherited extends InheritedWidget {
  const _MealsInherited({required this.meals, required super.child});

  final List<Meal> meals;

  @override
  bool updateShouldNotify(_MealsInherited oldWidget) => meals != oldWidget.meals;
}
