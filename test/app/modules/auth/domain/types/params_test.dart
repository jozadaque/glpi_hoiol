import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

void main() {
  test('Params: Should return a params object', () {
    Params object = Params(password: 'password', user: 'user');

    expect(object is Params, true);
  });
}
