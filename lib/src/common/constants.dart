import 'package:flutter_azure_tts/src/common/config.dart';

import 'endpoint_type.dart';

class Endpoints {
  Endpoints._();

  static String endpoint(EndpointType type) {
    switch (type) {
      case EndpointType.audio:
        return audio;
      case EndpointType.longAudio:
        return longAudio;
      case EndpointType.issueToken:
        return issueToken;
      case EndpointType.voicesList:
        return voicesList;
      case EndpointType.customVoice:
        return customVoice;
      default:
        throw Exception("Invalid endpoint type $type");
    }
  }

  ///Endpoint used to get Access Token for requests authentication.
  static String get issueToken {
    if (Config().customEndpoints.containsKey(EndpointType.issueToken) &&
        Config().customEndpoints[EndpointType.issueToken] != null) {
      return Config().customEndpoints[EndpointType.issueToken]!;
    } else
      return "https://${Config().region}.api.cognitive.microsoft.com/sts/v1.0/issueToken";
  }

  ///Endpoint used to get the list of voices supported by the endpoint.
  static String get voicesList {
    if (Config().customEndpoints.containsKey(EndpointType.voicesList) &&
        Config().customEndpoints[EndpointType.voicesList] != null) {
      return Config().customEndpoints[EndpointType.voicesList]!;
    } else {
      return "https://${Config().region}.tts.speech.microsoft.com/cognitiveservices/voices/list";
    }
  }

  ///Endpoint used to get a audio file for custom voices.
  static String get customVoice {
    if (Config().customEndpoints.containsKey(EndpointType.customVoice) &&
        Config().customEndpoints[EndpointType.customVoice] != null) {
      return Config().customEndpoints[EndpointType.customVoice]!;
    } else {
      return "https://${Config().region}.voice.speech.microsoft.com/cognitiveservices/v1?deploymentId=";
    }
  }

  static String get longAudio {
    if (Config().customEndpoints.containsKey(EndpointType.longAudio) &&
        Config().customEndpoints[EndpointType.longAudio] != null) {
      return Config().customEndpoints[EndpointType.longAudio]!;
    } else {
      return "https://${Config().region}.customvoice.api.speech.microsoft.com";
    }
  }

  static String get audio {
    if (Config().customEndpoints.containsKey(EndpointType.audio) &&
        Config().customEndpoints[EndpointType.audio] != null) {
      return Config().customEndpoints[EndpointType.audio]!;
    } else {
      return "https://${Config().region}.tts.speech.microsoft.com/cognitiveservices/v1";
    }
  }
}

class Constants {
  static Duration get authRefreshDuration => Duration(minutes: 8);
}
