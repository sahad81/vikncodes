
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_codes_machin_test/src/data/repo/salesrepo.dart';
import 'package:vikn_codes_machin_test/src/model/salse_model.dart';
import 'package:vikn_codes_machin_test/util/app_constants.dart';

class HomeController extends GetxController {
  final SharedPreferences preferences;
  HomeController({required this.preferences});
 bool _isLoading = false;
bool get isLoading => _isLoading;
List<Datum>? salelist = [];
List<int> _saleOffsetList = [];
int? _salePageSize;
int? get salePageSize => _salePageSize;
int _pageoffset = 1;
int get pageoffset => _pageoffset;
bool _salePaginate = false;
bool get salePagenate => _salePaginate;
Future<void> getsaleList(int offset) async {
  try {
    if (offset == 1) {
      _isLoading = true;
      update();
    }
      else{
        _salePaginate=true;
        update();
      }

    final String? token = preferences.getString(AppConstants.TOKEN);
    Response response = await SalesRepo.getsalelist(token!, offset);
print('callling');
    if (response.statusCode == 200) {
      SaleModel sale = SaleModel.fromJson(response.body);
      _salePageSize = sale.totalCount;

      if (offset == 1 || salelist == null) {
        print('ddd');
        salelist = [];
        _saleOffsetList = [];
        _pageoffset = 1;
      }
    

      _saleOffsetList.add(offset);
      salelist?.addAll(sale.data!);
    }

    _isLoading = false;
    _salePaginate = false;
    update();
  } catch (e) {
    _isLoading = false;
    _salePaginate=false;
    update();
  }

}
  void showBottomLoader() {
    _isLoading = true;
    update();
  }

  void setsaleOffset(int offset) {
    _pageoffset = offset;
  }



}
