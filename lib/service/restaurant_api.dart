import 'package:dio/dio.dart';

import '../models/model_restaurant.dart';

class RestaurantService {
  Future<List<RestaurantElement>?> getRestaurant() async {
    try {
      var response = await Dio().get(
        "https://restaurant-api.dicoding.dev/list",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      var restaurant = Restaurant.fromJson(response.data);
      var listRestaurant = restaurant.restaurants;
      return listRestaurant;
    } catch (e) {
      // ignore: avoid_print
      print("Tidak dapat API , Error ==> $e");
    }
    return null;
  }
}
