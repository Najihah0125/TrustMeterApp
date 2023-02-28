import 'package:trustmeter/Screens/evaluate_criteria_screen.dart';

class Calculations {
  List<String> rates = [];
  List<String> ewom = [];
  List<String> scc = [];
  List<String> iq = [];
  List<String> people = [];
  String ewomFinal = '';
  String sccFinal = '';
  String iqFinal = '';
  String peopleFinal = '';

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

    print(rates);
    print(ewom);
    print(scc);
    print(iq);
    print(people);
    finalRate();
  }

  void finalRate() {
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

    ewomFinal = lookupThreeElements[[ewom[0], ewom[1], ewom[2]]]!;
    sccFinal = lookupTwoElements[[scc[0], scc[1]]]!;
    iqFinal = lookupFourElements[[iq[0], iq[1], iq[2], iq[3]]]!;
    peopleFinal = lookupThreeElements[[people[0], people[1], people[2]]]!;

    print('Ewom Final' + ewomFinal);
    print('Scc Final' + sccFinal);
    print('Iq Final' + iqFinal);
    print('people Final' + peopleFinal);
  }
}
