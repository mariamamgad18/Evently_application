import 'package:eventlyapp/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../Providers/Event_List_Provider.dart';
import '../../Providers/User_provider.dart';
import '../../utils/app_theme.dart';
import 'EventContainer.dart';

class FavoriteTab extends StatefulWidget {
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late EventListProvider eventListProvider;
  late  UserProvider userProvider;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // استدعاء البيانات بعد بناء الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventListProvider = Provider.of<EventListProvider>(context, listen: false);
      eventListProvider.getFavoriteEvents(userProvider.currentuser!.id); // جلب الـ favorite events
    });
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على instance محدثة من Provider
    eventListProvider = Provider.of<EventListProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          // حقل البحث
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue, // أيقونة البحث زرقاء
                  size: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppTheme.TextFieldContainerColor(context),
                    width: 1,
                  ),
                ),
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),

          // عرض القائمة
          Expanded(
            child: eventListProvider.FavoriteEventslist.isEmpty
                ? Center(
              child: Text(
                "No Event Found",
                style: TextStyle(color: Appcolors.blackcolor),
              ),
            )
                : ListView.builder(
              itemCount: eventListProvider.FavoriteEventslist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Eventcontainer(
                      event: eventListProvider.FavoriteEventslist[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
