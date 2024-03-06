import 'dart:convert';
import 'package:hubtest/models/api_response.dart';
import 'package:hubtest/models/expenses_model.dart';
import 'package:hubtest/services/constant.dart';
import 'package:http/http.dart' as http;

// fonction pour recuperz toutes les dépenses

Future<ApiResponse> getAllExpences() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse(expense_URL),
    headers: {
      'Accept': 'application/json',
    }
    ,
    );
print(response.body);

  switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body).map((p)=> ExpensesList.fromJson(p)).toList();
        print("succes");
        break;

      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;

      case 401:
        apiResponse.error = unauthorized;
        break;

      default:
        print(
            'Erreur inattendue - Statut: ${response.statusCode}, Reponse: ${response.body}');
        apiResponse.error = somethingwentwrong;
        break;
    }

  } catch (e) {
        print('Error in recupération expences: $e');
    apiResponse.error = serverError;
  }
  return apiResponse;
}