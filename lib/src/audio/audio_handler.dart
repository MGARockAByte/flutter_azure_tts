import 'package:flutter_azure_tts/src/audio/audio_client.dart';
import 'package:flutter_azure_tts/src/audio/audio_request_param.dart';
import 'package:flutter_azure_tts/src/audio/audio_response_mapper.dart';
import 'package:flutter_azure_tts/src/audio/audio_responses.dart';
import 'package:flutter_azure_tts/src/auth/authentication_types.dart';
import 'package:flutter_azure_tts/src/common/config.dart';
import 'package:flutter_azure_tts/src/common/constants.dart';
import 'package:flutter_azure_tts/src/ssml/ssml.dart';
import 'package:http/http.dart' as http;

import 'audio_type_header.dart';

class AudioHandler {
  Future<AudioSuccess> getAudio(AudioRequestParams params) async {
    final mapper = AudioResponseMapper();
    final header = Config().useSTSToken == true
        ? BearerAuthenticationHeader(token: Config.authToken!.token)
        : SubscriptionKeyAuthenticationHeader(
            subscriptionKey: Config().subscriptionKey);
    final audioClient = AudioClient(
      client: http.Client(),
      authHeader: header,
      audioTypeHeader: AudioTypeHeader(audioFormat: params.audioFormat),
    );

    try {
      final ssml =
          Ssml(voice: params.voice, text: params.text, speed: params.rate ?? 1);

      String endpoint = Endpoints.audio;
      if (params.voice.deploymentId.isNotEmpty) {
        endpoint = Endpoints.customVoice + params.voice.deploymentId;
      }

      final response =
          await audioClient.post(Uri.parse(endpoint), body: ssml.buildSsml);
      final audioResponse = mapper.map(response);
      if (audioResponse is AudioSuccess) {
        return audioResponse;
      } else {
        throw audioResponse;
      }
    } catch (e) {
      rethrow;
    }
  }
}
