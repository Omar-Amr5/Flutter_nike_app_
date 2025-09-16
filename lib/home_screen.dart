import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {"name": "Nike Air Max", "image": "https://i.imgur.com/QwhZRyL.png"},
      {"name": "Nike Revolution", "image": "https://i.imgur.com/QwhZRyL.png"},
      {"name": "Nike Dunk Low", "image": "https://i.imgur.com/QwhZRyL.png"},
      {"name": "Nike Air Force 1", "image": "https://i.imgur.com/QwhZRyL.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Container(
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(
                        "Nike Banner 1",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green[100],
                    child: Center(
                      child: Text(
                        "Nike Banner 2",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              AppLocalizations.of(context)!.ourProducts,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          products[index]["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(products[index]["name"]!),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${products[index]["name"]} added to cart",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Text(
              AppLocalizations.of(context)!.hotOffers,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.local_offer, color: Colors.red),
                  title: Text("Special Nike Offer ${index + 1}"),
                  subtitle: const Text("Discount available for a limited time."),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
