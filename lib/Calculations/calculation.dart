import 'package:collection/collection.dart';

class Calculations {
  List<String> rates = [];
  List<String> ewom = [];
  List<String> scc = [];
  List<String> iq = [];
  List<String> people = [];
  List<String> allCategoriesFinal = [];
  String ewomFinal = '';
  String sccFinal = '';
  String iqFinal = '';
  String peopleFinal = '';
  String trustResult = '';
  final unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
  var not = ['not', 'not', 'not'];

  void assignRate(List<double> criteria) {
    rates = criteria.map((criteria) {
      if (criteria <= 10 && criteria >= 7) {
        return 'high';
      } else if (criteria <= 6 && criteria >= 4) {
        return 'moderate';
      } else if (criteria <= 3 && criteria >= 1) {
        return 'low';
      } else {
        return 'unknown';
      }
    }).toList();

    ewom = rates.sublist(0, 3);
    scc = rates.sublist(3, 5);
    iq = rates.sublist(5, 9);
    people = rates.sublist(9, 12);

    finalRateFourCategories();
  }

  void finalRateFourCategories() {
    //for ewom & people
    var lookupThreeElements = {
      ['high', 'high', 'high']: 'high',
      ['high', 'high', 'moderate']: 'high',
      ['high', 'high', 'low']: 'high',
      ['high', 'moderate', 'high']: 'high',
      ['high', 'moderate', 'moderate']: 'moderate',
      ['high', 'moderate', 'low']: 'moderate',
      ['high', 'low', 'high']: 'high',
      ['high', 'low', 'moderate']: 'moderate',
      ['high', 'low', 'low']: 'high',
      ['moderate', 'high', 'high']: 'high',
      ['moderate', 'high', 'moderate']: 'moderate',
      ['moderate', 'high', 'low']: 'moderate',
      ['moderate', 'moderate', 'high']: 'moderate',
      ['moderate', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'low']: 'moderate',
      ['moderate', 'low', 'high']: 'moderate',
      ['moderate', 'low', 'moderate']: 'moderate',
      ['moderate', 'low', 'low']: 'low',
      ['low', 'high', 'high']: 'moderate',
      ['low', 'high', 'moderate']: 'moderate',
      ['low', 'high', 'low']: 'moderate',
      ['low', 'moderate', 'high']: 'moderate',
      ['low', 'moderate', 'moderate']: 'moderate',
      ['low', 'moderate', 'low']: 'low',
      ['low', 'low', 'high']: 'moderate',
      ['low', 'low', 'moderate']: 'low',
      ['low', 'low', 'low']: 'low',
    };

    //for scc
    var lookupTwoElements = {
      ['high', 'high']: 'high',
      ['high', 'moderate']: 'high',
      ['high', 'low']: 'moderate',
      ['moderate', 'high']: 'high',
      ['moderate', 'moderate']: 'moderate',
      ['moderate', 'low']: 'low',
      ['low', 'high']: 'moderate',
      ['low', 'moderate']: 'low',
      ['low', 'low']: 'low',
    };

    //for iq
    var lookupFourElements = {
      ['high', 'high', 'high', 'high']: 'high',
      ['high', 'high', 'high', 'moderate']: 'high',
      ['high', 'high', 'high', 'low']: 'moderate',
      ['high', 'high', 'moderate', 'high']: 'high',
      ['high', 'high', 'moderate', 'moderate']: 'high',
      ['high', 'high', 'moderate', 'low']: 'moderate',
      ['high', 'high', 'low', 'high']: 'high',
      ['high', 'high', 'low', 'moderate']: 'moderate',
      ['high', 'high', 'low', 'low']: 'moderate',
      ['high', 'moderate', 'high', 'high']: 'high',
      ['high', 'moderate', 'high', 'moderate']: 'high',
      ['high', 'moderate', 'high', 'low']: 'moderate',
      ['high', 'moderate', 'moderate', 'high']: 'high',
      ['high', 'moderate', 'moderate', 'moderate']: 'high',
      ['high', 'moderate', 'moderate', 'low']: 'moderate',
      ['high', 'moderate', 'low', 'high']: 'moderate',
      ['high', 'moderate', 'low', 'moderate']: 'moderate',
      ['high', 'moderate', 'low', 'low']: 'low',
      ['high', 'low', 'high', 'high']: 'high',
      ['high', 'low', 'high', 'moderate']: 'moderate',
      ['high', 'low', 'high', 'low']: 'moderate',
      ['high', 'low', 'moderate', 'high']: 'moderate',
      ['high', 'low', 'moderate', 'moderate']: 'moderate',
      ['high', 'low', 'moderate', 'low']: 'low',
      ['high', 'low', 'low', 'high']: 'moderate',
      ['high', 'low', 'low', 'moderate']: 'low',
      ['high', 'low', 'low', 'low']: 'low',
      //moderate
      ['moderate', 'high', 'high', 'high']: 'high',
      ['moderate', 'high', 'high', 'moderate']: 'moderate',
      ['moderate', 'high', 'high', 'low']: 'moderate',
      ['moderate', 'high', 'moderate', 'high']: 'moderate',
      ['moderate', 'high', 'moderate', 'moderate']: 'high',
      ['moderate', 'high', 'moderate', 'low']: 'moderate',
      ['moderate', 'high', 'low', 'high']: 'moderate',
      ['moderate', 'high', 'low', 'moderate']: 'moderate',
      ['moderate', 'high', 'low', 'low']: 'low',
      ['moderate', 'moderate', 'high', 'high']: 'high',
      ['moderate', 'moderate', 'high', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'high', 'low']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'high']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'low']: 'low',
      ['moderate', 'moderate', 'low', 'high']: 'moderate',
      ['moderate', 'moderate', 'low', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'low', 'low']: 'low',
      ['moderate', 'low', 'high', 'high']: 'moderate',
      ['moderate', 'low', 'high', 'moderate']: 'moderate',
      ['moderate', 'low', 'high', 'low']: 'low',
      ['moderate', 'low', 'moderate', 'high']: 'moderate',
      ['moderate', 'low', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'low', 'moderate', 'low']: 'low',
      ['moderate', 'low', 'low', 'high']: 'low',
      ['moderate', 'low', 'low', 'moderate']: 'low',
      ['moderate', 'low', 'low', 'low']: 'low',
      //low
      ['low', 'high', 'high', 'high']: 'moderate',
      ['low', 'high', 'high', 'moderate']: 'moderate',
      ['low', 'high', 'high', 'low']: 'moderate',
      ['low', 'high', 'moderate', 'high']: 'moderate',
      ['low', 'high', 'moderate', 'moderate']: 'moderate',
      ['low', 'high', 'moderate', 'low']: 'low',
      ['low', 'high', 'low', 'high']: 'moderate',
      ['low', 'high', 'low', 'moderate']: 'low',
      ['low', 'high', 'low', 'low']: 'low',
      ['low', 'moderate', 'high', 'high']: 'moderate',
      ['low', 'moderate', 'high', 'moderate']: 'moderate',
      ['low', 'moderate', 'high', 'low']: 'low',
      ['low', 'moderate', 'moderate', 'high']: 'moderate',
      ['low', 'moderate', 'moderate', 'moderate']: 'moderate',
      ['low', 'moderate', 'moderate', 'low']: 'low',
      ['low', 'moderate', 'low', 'high']: 'low',
      ['low', 'moderate', 'low', 'moderate']: 'low',
      ['low', 'moderate', 'low', 'low']: 'low',
      ['low', 'low', 'high', 'high']: 'moderate',
      ['low', 'low', 'high', 'moderate']: 'low',
      ['low', 'low', 'high', 'low']: 'low',
      ['low', 'low', 'moderate', 'high']: 'low',
      ['low', 'low', 'moderate', 'moderate']: 'low',
      ['low', 'low', 'moderate', 'low']: 'low',
      ['low', 'low', 'low', 'high']: 'low',
      ['low', 'low', 'low', 'moderate']: 'low',
      ['low', 'low', 'low', 'low']: 'low',
    };

    //matching ewom with lookup
    var foundKeyForEwom = lookupThreeElements.keys.firstWhere(
      (key) => unOrdDeepEq(key, ewom),
      orElse: () => not,
    );

    if (foundKeyForEwom != null) {
      var value = lookupThreeElements[foundKeyForEwom];
      ewomFinal = value ?? 'ewom invalid';
    } else {
      ewomFinal = 'not found in lookup';
    }

    //matching scc with lookup
    var foundKeyForScc = lookupTwoElements.keys.firstWhere(
      (key) => unOrdDeepEq(key, scc),
      orElse: () => not,
    );

    if (foundKeyForScc != null) {
      var value = lookupTwoElements[foundKeyForScc];
      sccFinal = value ?? 'scc invalid';
    } else {
      sccFinal = 'Key $scc not found in lookup';
    }

    //matching iq with lookup
    var foundKeyForIq = lookupFourElements.keys.firstWhere(
      (key) => unOrdDeepEq(key, iq),
      orElse: () => not,
    );

    if (foundKeyForIq != null) {
      var value = lookupFourElements[foundKeyForIq];
      iqFinal = value ?? 'iq not valid';
    } else {
      iqFinal = 'Key $iq not found in lookup';
    }

    //matching people with lookup
    var foundKeyForPeople = lookupThreeElements.keys.firstWhere(
      (key) => unOrdDeepEq(key, people),
      orElse: () => not,
    );

    if (foundKeyForPeople != null) {
      var value = lookupThreeElements[foundKeyForPeople];
      peopleFinal = value ?? 'people not valid';
    } else {
      peopleFinal = 'Key $people not found in lookup';
    }

    allCategoriesFinal = [ewomFinal, sccFinal, iqFinal, peopleFinal];
    finalTrust();
  }

  void finalTrust() {
    var lookupFinalTrust = {
      ['high', 'high', 'high', 'high']: 'high',
      ['high', 'high', 'high', 'moderate']: 'moderate',
      ['high', 'high', 'high', 'low']: 'high',
      ['high', 'high', 'moderate', 'high']: 'high',
      ['high', 'high', 'moderate', 'moderate']: 'moderate',
      ['high', 'high', 'moderate', 'low']: 'moderate',
      ['high', 'high', 'low', 'high']: 'high',
      ['high', 'high', 'low', 'moderate']: 'moderate',
      ['high', 'high', 'low', 'low']: 'moderate',
      ['high', 'moderate', 'high', 'high']: 'high',
      ['high', 'moderate', 'high', 'moderate']: 'moderate',
      ['high', 'moderate', 'high', 'low']: 'moderate',
      ['high', 'moderate', 'moderate', 'high']: 'high',
      ['high', 'moderate', 'moderate', 'moderate']: 'moderate',
      ['high', 'moderate', 'moderate', 'low']: 'moderate',
      ['high', 'moderate', 'low', 'high']: 'moderate',
      ['high', 'moderate', 'low', 'moderate']: 'moderate',
      ['high', 'moderate', 'low', 'low']: 'low',
      ['high', 'low', 'high', 'high']: 'moderate',
      ['high', 'low', 'high', 'moderate']: 'moderate',
      ['high', 'low', 'high', 'low']: 'moderate',
      ['high', 'low', 'moderate', 'high']: 'moderate',
      ['high', 'low', 'moderate', 'moderate']: 'moderate',
      ['high', 'low', 'moderate', 'low']: 'low',
      ['high', 'low', 'low', 'high']: 'moderate',
      ['high', 'low', 'low', 'moderate']: 'low',
      ['high', 'low', 'low', 'low']: 'low',
      //moderate
      ['moderate', 'high', 'high', 'high']: 'high',
      ['moderate', 'high', 'high', 'moderate']: 'moderate',
      ['moderate', 'high', 'high', 'low']: 'moderate',
      ['moderate', 'high', 'moderate', 'high']: 'high',
      ['moderate', 'high', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'high', 'moderate', 'low']: 'moderate',
      ['moderate', 'high', 'low', 'high']: 'moderate',
      ['moderate', 'high', 'low', 'moderate']: 'moderate',
      ['moderate', 'high', 'low', 'low']: 'low',
      ['moderate', 'moderate', 'high', 'high']: 'moderate',
      ['moderate', 'moderate', 'high', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'high', 'low']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'high']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'moderate', 'moderate', 'low']: 'low',
      ['moderate', 'moderate', 'low', 'high']: 'moderate',
      ['moderate', 'moderate', 'low', 'moderate']: 'low',
      ['moderate', 'moderate', 'low', 'low']: 'low',
      ['moderate', 'low', 'high', 'high']: 'moderate',
      ['moderate', 'low', 'high', 'moderate']: 'moderate',
      ['moderate', 'low', 'high', 'low']: 'low',
      ['moderate', 'low', 'moderate', 'high']: 'moderate',
      ['moderate', 'low', 'moderate', 'moderate']: 'moderate',
      ['moderate', 'low', 'moderate', 'low']: 'low',
      ['moderate', 'low', 'low', 'high']: 'low',
      ['moderate', 'low', 'low', 'moderate']: 'low',
      ['moderate', 'low', 'low', 'low']: 'low',
      //low
      ['low', 'high', 'high', 'high']: 'moderate',
      ['low', 'high', 'high', 'moderate']: 'moderate',
      ['low', 'high', 'high', 'low']: 'moderate',
      ['low', 'high', 'moderate', 'high']: 'moderate',
      ['low', 'high', 'moderate', 'moderate']: 'moderate',
      ['low', 'high', 'moderate', 'low']: 'low',
      ['low', 'high', 'low', 'high']: 'moderate',
      ['low', 'high', 'low', 'moderate']: 'low',
      ['low', 'high', 'low', 'low']: 'low',
      ['low', 'moderate', 'high', 'high']: 'moderate',
      ['low', 'moderate', 'high', 'moderate']: 'moderate',
      ['low', 'moderate', 'high', 'low']: 'low',
      ['low', 'moderate', 'moderate', 'high']: 'moderate',
      ['low', 'moderate', 'moderate', 'moderate']: 'moderate',
      ['low', 'moderate', 'moderate', 'low']: 'low',
      ['low', 'moderate', 'low', 'high']: 'low',
      ['low', 'moderate', 'low', 'moderate']: 'low',
      ['low', 'moderate', 'low', 'low']: 'moderate',
      ['low', 'low', 'high', 'high']: 'moderate',
      ['low', 'low', 'high', 'moderate']: 'low',
      ['low', 'low', 'high', 'low']: 'low',
      ['low', 'low', 'moderate', 'high']: 'low',
      ['low', 'low', 'moderate', 'moderate']: 'low',
      ['low', 'low', 'moderate', 'low']: 'moderate',
      ['low', 'low', 'low', 'high']: 'low',
      ['low', 'low', 'low', 'moderate']: 'moderate',
      ['low', 'low', 'low', 'low']: 'low',
    };

    //matching finalTrust with lookup
    var foundKeyForFinalTrust = lookupFinalTrust.keys.firstWhere(
      (key) => unOrdDeepEq(key, allCategoriesFinal),
      orElse: () => not,
    );

    if (foundKeyForFinalTrust != null) {
      var value = lookupFinalTrust[foundKeyForFinalTrust];
      trustResult = value ?? 'trust result not valid';
      // pass trustResult value to TrustResultScreen
    } else {}
  }
}
