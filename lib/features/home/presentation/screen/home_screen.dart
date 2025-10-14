import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:turbo_waiter/core/di/dependancy_injection.dart';
import 'package:turbo_waiter/core/helpers/app_dialogs.dart';
import 'package:turbo_waiter/core/helpers/app_texts.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/core/helpers/local_storage_helper.dart';
import 'package:turbo_waiter/core/helpers/widget_extensions.dart';
import 'package:turbo_waiter/core/routing/routes.dart';
import 'package:turbo_waiter/features/home/presentation/view/home_page_qr_view.dart';
import 'package:turbo_waiter/features/home/presentation/view/home_page_scan_qr_vie_buttion.dart';
import 'package:turbo_waiter/features/home/presentation/view/home_page_view_ticket_button.dart';
import 'package:turbo_waiter/features/home/presentation/view/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeScreenAppBar(
        title: AppTexts.appName,
        leading: CupertinoButton(
          padding: EdgeInsetsDirectional.only(start: 3.w),
          minimumSize: Size(0, 0),
          onPressed: () async {
            await AppDialogs.showQuestionnaireDialog(
              context,
              AppTexts.logOut,
              () async {
                await getIt<LocalStorageHelper>().logOut().then((val) {
                  // UserType.instance.logOut();
                  // context
                  //     .read<MenuCubit>()
                  //     .googleSignOut();

                  context.pushNamedAndRemoveUntil(
                    Routes.loginScreen,
                    predicate: (route) => false,
                  );
                });
              },
            );
          },

          child: Icon(Icons.logout),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 2),
            HomePageScanQrVewButton(
              // onPressed: () => context.pushNamed(
              //   Routes.qrCodeScannerScreen,
              //   arguments: {
              //     "ticketStatusCubit": context.read<TicketStatusCubit>(),
              //   },
              // ),
            ),
            Spacer(),
            HomePageQrView().onTap(
              // onTap: () => context.pushNamed(
              //   Routes.qrCodeScannerScreen,
              //   arguments: {
              //     "ticketStatusCubit": context.read<TicketStatusCubit>(),
              //   },
              // ),
            ),
            Spacer(flex: 4),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
