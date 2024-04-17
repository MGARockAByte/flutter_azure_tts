import 'package:flutter_azure_tts/src/auth/authentication_types.dart';
import 'package:flutter_azure_tts/src/common/config.dart';
import 'package:flutter_azure_tts/src/common/constants.dart';
import 'package:flutter_azure_tts/src/voices/voices.dart';
import 'package:flutter_azure_tts/src/voices/voices_client.dart';
import 'package:flutter_azure_tts/src/voices/voices_response_mapper.dart';
import 'package:http/http.dart' as http;

class VoicesHandler {
  Future<VoicesSuccess> getVoices() async {
    final client = http.Client();
    final header = Config().useSTSToken == true
        ? BearerAuthenticationHeader(token: Config.authToken!.token)
        : SubscriptionKeyAuthenticationHeader(
            subscriptionKey: Config().subscriptionKey);
    final voiceClient = VoicesClient(client: client, header: header);

    try {
      final mapper = VoicesResponseMapper();
      final response = await voiceClient.get(Uri.parse(Endpoints.voicesList));
      final voicesResponse = mapper.map(response);
      if (voicesResponse is VoicesSuccess) {
        return voicesResponse;
      } else {
        throw voicesResponse;
      }
    } catch (e) {
      rethrow;
    }
  }
}
