import 'package:citgroupvn_efood_table/base/base_controller.dart';
import 'package:citgroupvn_efood_table/presentation/controller/oder/order_list_controller.dart';
import 'package:citgroupvn_efood_table/presentation/controller/settings/settings_controller.dart';
import 'package:citgroupvn_efood_table/presentation/screens/order/oder_list/oder_details.dart';
import 'package:citgroupvn_efood_table/presentation/screens/order/oder_list/order_list_view.dart';
import 'package:citgroupvn_efood_table/presentation/screens/order/payment.dart';
import 'package:citgroupvn_efood_table/presentation/screens/promotional_page/promotional.dart';
import 'package:citgroupvn_efood_table/presentation/screens/settings/setting_view.dart';

class MainTabviewController extends BaseController {
  var selectedIndex = 0.obs;
  RxString page = 'home'.obs;

  @override
  Future<void> onInit() async {
    Get.lazyPut(() => MainTabviewController());
    Get.lazyPut(() => OrderListController(orderRepo: Get.find()));
    super.onInit();
    // Get.updateLocale(Locale("vi"));
    // Get.find<TabController>();
  }

  RxList<Widget> body = RxList([
    const HomeScreen(),
    const OrderListView(),
    const DetailsOrderScreen(),
    const SettingsView(),
  ]);
  onItemTapped(String index) {
    page.value = index;
    switch (page.value) {
      case 'home':
        Get.find<CartController>();
        Get.find<ProductController>();
        return selectedIndex.value = 0;
      case 'order-list':
        Get.find<OrderListController>();
        return selectedIndex.value = 1;
      case 'details-order':
        Get.find<DetailsOrderScreen>();
        return selectedIndex.value = 2;
      case 'settings':
        Get.find<SettingsController>();
        return selectedIndex.value = 3;
      default:
        return selectedIndex.value = 0;
    }
  }

  onItemTapped1(int index) {
    switch (index) {
      case 0:
        Get.find<CartController>();
        Get.find<ProductController>();
        return selectedIndex.value = 0;
      case 1:
        Get.find<OrderListController>();
        return selectedIndex.value = 1;
      case 2:
        Get.find<DetailsOrderScreen>();
        return selectedIndex.value = 2;
      case 3:
        Get.find<SettingsController>();
        return selectedIndex.value = 3;
      default:
        return selectedIndex.value = 0;
    }
  }
}
