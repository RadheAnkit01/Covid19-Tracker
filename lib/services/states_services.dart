import 'package:covid19_tracker/model/world_state_model.dart';
import 'package:covid19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<Map<String, double>> fetchWorldStates() async {
    try {
      final response = await http
          .get(Uri.parse(AppUrl.worldStateApi))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        // print(response.body);
        return worldStatesModelFromJson(response.body);
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
