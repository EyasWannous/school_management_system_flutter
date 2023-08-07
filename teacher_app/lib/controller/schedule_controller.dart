import 'package:get/get.dart';
import 'package:teacher_app/model/schedule_model.dart';
import 'package:teacher_app/services/rest_api_get.dart';

class ScheduleController extends GetxController {
  String selectedValue = 'sunday';
  List<String> dropdownItems = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday'
  ];

  List<ScheduleModel> scheduleItem = [];
  bool isLoading = false;

  @override
  void onInit() async {
    await fetchDaysData();
    fetchScheduleData();
    super.onInit();
  }

  fetchDaysData() async {
    isLoading = true;
    update();

    dropdownItems.clear();
    dropdownItems = await RestAPIGet.getdays();

    if (dropdownItems.isEmpty) {
      dropdownItems = ["it's Empty"];
      selectedValue = dropdownItems[0];
      update();
      return;
    }

    selectedValue = dropdownItems[0];

    isLoading = false;
    update();
  }

  fetchScheduleData() async {
    isLoading = true;
    update();

    scheduleItem.clear();
    scheduleItem = await RestAPIGet.getschedule(selectedValue);

    isLoading = false;
    update();
  }

  onDropdownChanged(String value) async {
    if (selectedValue == value) return;

    selectedValue = value;

    isLoading = true;
    update();

    scheduleItem.clear();
    scheduleItem = await RestAPIGet.getschedule(selectedValue);

    isLoading = false;
    update();
  }
}
