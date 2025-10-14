import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:turbo_waiter/core/di/dependancy_injection.dart';
import 'package:turbo_waiter/core/helpers/enums_repo.dart';
import 'package:turbo_waiter/core/helpers/extensions.dart';
import 'package:turbo_waiter/features/ticket_details/presentation/cubit/ticket_details_cubit.dart';
import 'package:turbo_waiter/features/ticket_details/presentation/widgets/ticket_card.dart';
import 'package:turbo_waiter/features/ticket_details/presentation/widgets/ticket_field.dart';
import 'package:turbo_waiter/gen/assets.gen.dart';

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C1C65), Color(0xFF7A3AED)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              BlocBuilder<TicketDetailsCubit, TicketDetailsState>(
                builder: (context, state) {
                  // final cubit = context.read<TicketDetailsCubit>();
                  return state is TicketDetailsError
                      ? Center(child: Text(state.errorMessage))
                      : state is TicketDetailsLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : state is TicketDetailsLoaded
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Back button
                              const SizedBox(height: 16),

                              // صاحب التذكرة section
                              TicketCardSection(
                                title: "صاحب التذكرة",
                                icon: Icons.person,
                                fields: [
                                  TicketInfoField(
                                    label: "الاسم",
                                    value:
                                        state.ticketDetails.attendee?.name ??
                                        "---",
                                    icon: Icons.person,
                                  ),

                                  TicketInfoField(
                                    label: "العمر",
                                    value:
                                        state.ticketDetails.attendee?.age
                                            .toString() ??
                                        "---",
                                    icon: Icons.calendar_month,
                                  ),
                                  TicketInfoField(
                                    label: "النوع",
                                    value:
                                        state
                                            .ticketDetails
                                            .attendee
                                            ?.genderName ??
                                        "---",
                                    icon: Icons.calendar_month,
                                  ),
                                  TicketInfoField(
                                    label: "رقم الهاتف",
                                    value:
                                        state.ticketDetails.attendee?.phone ??
                                        "---",
                                    icon: Icons.phone,
                                  ),
                                  TicketInfoField(
                                    label: "البريد الالكتروني",
                                    value:
                                        state.ticketDetails.attendee?.email ??
                                        "---",
                                    icon: Icons.email,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // التذكرة section
                              TicketCardSection(
                                title: "التذكرة",
                                iconSvg: Assets.svg.ticket,
                                fields: [
                                  TicketInfoField(
                                    label: "رقم التذكرة",
                                    value: (state.ticketDetails.id ?? '---')
                                        .toString(),
                                    icon: Icons.numbers,
                                  ),
                                  TicketInfoField(
                                    label: "عنوان التذكرة",
                                    value:
                                        state.ticketDetails.titleNumber ?? "",
                                    icon: Icons.location_on,
                                  ),
                                  TicketInfoField(
                                    label: "اسم التذكرة",
                                    value: state.ticketDetails.title ?? "---",
                                    iconSvg: Assets.svg.ticket,
                                  ),
                                  TicketInfoField(
                                    label: "التاريخ",
                                    value: intl.DateFormat("dd-MM-yyyy").format(
                                      state.ticketDetails.lastUpdatedOn ??
                                          DateTime.now(),
                                    ),
                                    icon: Icons.calendar_month,
                                  ),
                                  TicketInfoField(
                                    label: "السعر",
                                    value: state.ticketDetails.totalPrice
                                        .toString(),
                                    icon: Icons.attach_money,
                                  ),
                                  _getTicketEnumField(
                                    id: (state.ticketDetails.statusId ?? -1)
                                        .toInt(),
                                    enumName: "GetTicketType",
                                    title: "نوع التذكرة",
                                    icon: Assets.svg.ticket,
                                  ),
                                  _getTicketEnumField(
                                    id: (state.ticketDetails.statusId ?? -1)
                                        .toInt(),
                                    enumName: "GetTicketStatus",
                                    title: "حالة التذكرة",
                                    icon: Assets.svg.ticket,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : SizedBox();
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFA1E9C), Color(0xFF7A3AED)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: IconButton(
                      padding: const EdgeInsets.all(16),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: context.pop,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<Either<String, AppRemoteEnums>> _getTicketEnumField({
    required int id,
    required String enumName,
    required String title,
    icon,
  }) {
    return FutureBuilder(
      // Trigger the API call using your EnumsRepo (from getIt)
      future: getIt<EnumsRepo>().call(enumID: id, enumName: enumName),
      builder: (context, asyncSnapshot) {
        // --- Handle loading state ---
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return TicketInfoField(
            label: title,
            value: "جاري التحميل...", // Loading text
            iconSvg: Assets.svg.ticket,
          );
        }

        // --- Handle error or null data ---
        if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
          return TicketInfoField(
            label: title,
            value: "غير متاح", // Not available
            iconSvg: Assets.svg.ticket,
          );
        }

        // --- Extract the Either value safely ---
        final either = asyncSnapshot.data!;

        // --- Handle left (error) or right (success) cases ---
        return either.fold(
          // LEFT → API or Repo returned an error message
          (errorMessage) => TicketInfoField(
            label: title,
            value: "خطأ: $errorMessage",
            iconSvg: Assets.svg.ticket,
          ),

          // RIGHT → Successful response
          (appEnum) {
            final data = appEnum;
            return TicketInfoField(
              label: title,
              value: data.nameAr, // Display Arabic name
              iconSvg: Assets.svg.ticket,
            );
          },
        );
      },
    );
  }
}
