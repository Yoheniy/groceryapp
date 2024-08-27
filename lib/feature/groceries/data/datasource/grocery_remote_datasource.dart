import 'package:grocessary/feature/groceries/data/models/grocery_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroceryRemoteDataSource {
  final http.Client client;

  GroceryRemoteDataSource({required this.client});

  Future<List<GroceryModel>> fetchGroceries() async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((grocery) => GroceryModel.fromJson(grocery)).toList();
    } else {
      throw Exception('Failed to load groceries');
    }
  }

  Future<GroceryModel> fetchGroceryById(String id) async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return GroceryModel.fromJson(data);
    } else {
      throw Exception('Failed to load grocery');
    }
  }
}
