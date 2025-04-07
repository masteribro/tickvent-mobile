// import 'package:dio/dio.dart';

// class ApiService {
//   final Dio _dio = Dio(BaseOptions(baseUrl: kBaseApiUrl));

//   Future<void> sendLocationData(String latitude, String longitude) async {
//     try {
//       await _dio.post('/api/location', data: {
//         'latitude': latitude,
//         'longitude': longitude,
//       });
//     } catch (e) {
//       print('Error sending location data: $e');
//     }
//   }
// }
