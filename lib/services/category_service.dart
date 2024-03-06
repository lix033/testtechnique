

//ajouter une catégorie
import 'dart:convert';

import 'package:hubtest/models/api_response.dart';
import 'package:hubtest/models/category_model.dart';
import 'package:hubtest/services/constant.dart';
import 'package:http/http.dart' as http;


Future<ApiResponse> newCategorieAdd(String color, String name,
    String description, String? type, String?currency) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    Map<String, dynamic> requestBody = {
      'id': 2,
      'color': color,
      'name': name,
      'description': description,
      'type': type,
      'currency': currency,
    };

    final response = await http.post(Uri.parse(categories_URL),
        headers: {
          'Accept': 'application/json',
        },
        body: jsonEncode(requestBody));

    switch (response.statusCode) {
      case 201:
        Category category = Category.fromJson(
          jsonDecode(response.body),
        );
        print('Nouvelle catégorie ajoutée: $category');
        apiResponse.data = category;
        break;

      case 401:
        apiResponse.error = unauthorized;
        print('Erreur: Unauthorized');
        break;

      default:
        print(
            'Erreur inattendue - Statut: ${response.statusCode}, Reponse: ${response.body}');
        apiResponse.error = somethingwentwrong;
        break;
    }
  } catch (e) {
    print('Error in ajout categoiries: $e');
    apiResponse.error = serverError;
  }
  return apiResponse;
}
