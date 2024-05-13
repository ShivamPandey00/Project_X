import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;


Future<List<Restaurants>> fetchRestaurants() async {
  //final responce=await http.get(Uri.parse('api'));
  final String response = await rootBundle.loadString('assets/restaurant.json');
  // if(responce.statusCode==200) {
    List jsonResponse = jsonDecode(response);
    return jsonResponse.map((restaurant) => Restaurants.fromJson(restaurant)).toList();
  // } else {
  //   throw Exception('Error: Failed to loasd');
  // }
//   headers: {
//     HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
// },
}
class Restaurants {
  final int Id;
  final String Name;
  final double rating;

  const Restaurants({
    required this.Id,
    required this.Name,
    required this.rating,
});
  factory Restaurants.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'Id': int Id,
      'Name': String Name,
      'rating': double rating,
      } =>
          Restaurants(
            Id: Id,
            Name: Name,
            rating: rating,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
class restaurantlist extends StatefulWidget {
  const restaurantlist({super.key});

  @override
  State<restaurantlist> createState() => _restaurantlistState();
}

class _restaurantlistState extends State<restaurantlist> {
  late Future<List<Restaurants>> futureRestaurant;
  @override
  void initState() {
    super.initState();
    futureRestaurant=fetchRestaurants();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DINEOUT'),
      ),
      body: Center(
        child: FutureBuilder<List<Restaurants>>(
          future: futureRestaurant,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final restaurants= snapshot.data!;
              return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant=restaurants[index];
                    return ListTile(
                      title: Text(restaurant.Name),
                      subtitle: Text('${restaurant.rating}'),
                      onTap: (){
                        //api to call the restaurant detail
                      },
                    );
                  }
              );
            } else if(snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

