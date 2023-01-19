import 'package:albums_demo_app/data/models/address_model.dart';
import 'package:albums_demo_app/data/models/company_model.dart';
import 'package:albums_demo_app/data/models/geo_model.dart';
import 'package:albums_demo_app/data/models/user_model.dart';

abstract class BaseAuthRemoteDatasource{
  Future<UserModel> signInWithEmailAndPassword();
}

class AuthRemoteDatasource extends BaseAuthRemoteDatasource{
  @override
  Future<UserModel> signInWithEmailAndPassword() async{
    await Future<dynamic>.delayed(const Duration(milliseconds: 1200));
    return const UserModel(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
      address: AddressModel(
        street: 'Kulas Light',
        suite: 'Apt. 556',
        city: 'Gwenborough',
        zipcode: '92998-3874',
        geo: GeoModel(
          lat: -37.3159,
          lng: 81.1496,
        ),
      ),
      company: CompanyModel(
        name: 'Romaguera-Crona',
        catchPhrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets',
      ),
    );
  }

}