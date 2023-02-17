// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../models/model_restaurant.dart';
import '../../service/restaurant_api.dart';

class main_menu extends StatefulWidget {
  const main_menu({Key? key}) : super(key: key);

  @override
  State<main_menu> createState() => _main_menuState();
}

class _main_menuState extends State<main_menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MainMenu"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[400]!,
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: null,
                      decoration: const InputDecoration.collapsed(
                        filled: true,
                        fillColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        hintText: "Search",
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder<List<RestaurantElement>?>(
                // future: RestaurantService().getRestaurant(),
                future: RestaurantService().getRestaurant(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    List<RestaurantElement> listRestaurant = snapshot.data!;
                    return Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listRestaurant.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = snapshot.data![index];
                        return ListTile(
                          leading: Image.network(
                            "https://restaurant-api.dicoding.dev/images/large/${data.pictureId}",
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                Text("Error"),
                          ),
                          subtitle: Text(data.city),
                          title: Text(data.name),
                        );
                      },
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
