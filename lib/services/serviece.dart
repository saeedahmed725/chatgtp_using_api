import 'dart:convert';
import 'package:chatgptdemo/constants/cosntant_service.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static Future getChatMsg({required String message}) async {
    final response = await http.post(
      Uri.parse(ConstantService.BASE_URL),
      headers: {
        'Authorization': 'Bearer ${ConstantService.API_KEY}',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": message,
        "max_tokens": 200,
        "temperature": 0
      }),
    );
    String bodyDecoded = utf8.decode(response.bodyBytes);
    String botTextEncoded = jsonDecode(bodyDecoded)['choices'][0]['text'].toString().split(RegExp(r'(?:\r?\n|\r)'))
        .where((s) => s.trim().isNotEmpty)
        .join('\n');
    if (response.statusCode == 200) {
      return botTextEncoded;
    } if(jsonDecode(response.body)['error'] != null) {
      throw Exception('Failed ${jsonDecode(response.body)['error']['message']}');
    }
  }
}
