import 'dart:convert';

import 'package:flutter_azure_tts/src/voices/voice_model.dart';
import 'package:test/test.dart';

import '../../fixures/fixure_reader.dart';

void main() {
  group('Voice', () {
    group('fromJson', () {
      test('should return a valid Voice object', () {
        final json = {
          "Name": "John",
          "DisplayName": "John Doe",
          "LocalName": "John",
          "ShortName": "JD",
          "Gender": "Male",
          "Locale": "en-US",
          "SampleRateHertz": "44100",
          "VoiceType": "Standard",
          "Status": "Available",
          "DeploymentId": "123456789"
        };

        final voice = Voice.fromJson(json);

        expect(voice.name, "John");
        expect(voice.displayName, "John Doe");
        expect(voice.localName, "John");
        expect(voice.shortName, "JD");
        expect(voice.gender, "Male");
        expect(voice.locale, "en-US");
        expect(voice.sampleRateHertz, "44100");
        expect(voice.voiceType, "Standard");
        expect(voice.status, "Available");
        expect(voice.deploymentId, "123456789");
      });
      test('should return a valid Voice object with optinal deploymentId', () {
        final json = {
          "Name": "John",
          "DisplayName": "John Doe",
          "LocalName": "John",
          "ShortName": "JD",
          "Gender": "Male",
          "Locale": "en-US",
          "SampleRateHertz": "44100",
          "VoiceType": "Standard",
          "Status": "Available",
        };

        final voice = Voice.fromJson(json);

        expect(voice.name, "John");
        expect(voice.displayName, "John Doe");
        expect(voice.localName, "John");
        expect(voice.shortName, "JD");
        expect(voice.gender, "Male");
        expect(voice.locale, "en-US");
        expect(voice.sampleRateHertz, "44100");
        expect(voice.voiceType, "Standard");
        expect(voice.status, "Available");
        expect(voice.deploymentId, "");
      });

      test('should throw no error if fixures get valid JSON object', () {
        final klaus = jsonDecode(fixture('klaus.json'));
        final tobi = jsonDecode(fixture('tobi.json'));

        final klausVoice = Voice.fromJson(klaus);
        expect(klausVoice.displayName, 'Klaus');

        final tobiVoice = Voice.fromJson(tobi);
        expect(tobiVoice.displayName, 'Tobi');
      });
    });

    test('toJson should return a valid JSON object', () {
      final voice = Voice(
        name: "John",
        displayName: "John Doe",
        localName: "John",
        shortName: "JD",
        gender: "Male",
        locale: "en-US",
        sampleRateHertz: "44100",
        voiceType: "Standard",
        status: "Available",
        deploymentId: "123456789",
      );

      final json = voice.toJson();

      expect(json["Name"], "John");
      expect(json["DisplayName"], "John Doe");
      expect(json["LocalName"], "John");
      expect(json["ShortName"], "JD");
      expect(json["Gender"], "Male");
      expect(json["Locale"], "en-US");
      expect(json["SampleRateHertz"], "44100");
      expect(json["VoiceType"], "Standard");
      expect(json["Status"], "Available");
      expect(json["DeploymentId"], "123456789");
    });

    test('props should return a list of all properties', () {
      final voice = Voice(
        name: "John",
        displayName: "John Doe",
        localName: "John",
        shortName: "JD",
        gender: "Male",
        locale: "en-US",
        sampleRateHertz: "44100",
        voiceType: "Standard",
        status: "Available",
        deploymentId: "123456789",
      );

      final props = voice.props;

      expect(props.length, 10);
      expect(props[0], "John");
      expect(props[1], "John Doe");
      expect(props[2], "John");
      expect(props[3], "JD");
      expect(props[4], "Male");
      expect(props[5], "en-US");
      expect(props[6], "44100");
      expect(props[7], "Standard");
      expect(props[8], "Available");
      expect(props[9], "123456789");
    });
  });
}
