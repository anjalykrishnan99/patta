import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:patta/api/converter/today_converter.dart' as today_converter;
import 'package:patta/ui/model/PaliWordCardModel.dart';
import 'package:patta/ui/model/StackedInspirationCardModel.dart';

void main() {
  test('Test whether sample today api is parsed correctly or not', () {
    // setup
    const baseUrl = '<giving-any-string-here-does-not-matter-for-this-test>';

    final responseJson = File('test/responseJson.json').readAsStringSync();

    // method to be tested
    final cardModels =
        today_converter.convertJsonToCardModels(responseJson, baseUrl);

    // check the results to be the models that we expect them to be
    expect(
      cardModels[0],
      PaliWordCardModel(
        id: '98955ba9-3819-4662-bd7c-6bff3d035d6e',
        header: 'Pāli Word of the Day',
        pali: 'kosa',
        audioUrl:
            '$baseUrl/uploads/cards/pali_word_card/audio/98955ba9-3819-4662-bd7c-6bff3d035d6e',
        translation: 'storehouse',
      ),
    );

    expect(
      cardModels[1],
      StackedInspirationCardModel(
        id: 'b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4',
        header: 'Inspiration of the Day',
        text:
            """ Enjoy some beautiful red flowers on the ground did you know you can also turn them into jam but you have to dry them on your rootop first which maybe you don't have the time for and you'd rather buy jam from a store.""",
        imageUrl:
            '$baseUrl/uploads/cards/stacked_inspiration_card/image/b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4/bluesky.png',
      ),
    );

    // TODO: After overlay-inspiration-card is added the last card parsed should be of that
  });
}
