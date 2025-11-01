// list of temp tables
import 'package:turbo_waiter/features/tables/presentation/page/tables_page.dart';

final tempTables = [
  TableModel(
    id: 1,
    isReserved: true,
    user: ReservedUser(
      userId: 1,
      username: 'ahmed123',
      fullName: 'Ahmed Mohamed',
    ),
  ),
  TableModel(id: 2, isReserved: false, user: null),
  TableModel(id: 3, isReserved: false, user: null),
  TableModel(id: 4, isReserved: false, user: null),

  TableModel(
    id: 5,
    isReserved: true,
    user: ReservedUser(
      userId: 3,
      username: 'mohamed345',
      fullName: 'Mohamed Ali',
    ),
  ),
  TableModel(id: 6, isReserved: false, user: null),
  TableModel(
    id: 7,
    isReserved: true,
    user: ReservedUser(
      userId: 5,
      username: 'yousef567',
      fullName: 'Yousef Mohamed',
    ),
  ),
  TableModel(id: 8, isReserved: false, user: null),
  TableModel(
    id: 9,
    isReserved: true,
    user: ReservedUser(
      userId: 5,
      username: 'Abdullah123',
      fullName: 'Abdullah Mohamed',
    ),
  ),
  TableModel(
    id: 10,
    isReserved: true,
    user: ReservedUser(
      userId: 5,
      username: 'Salem123',
      fullName: 'Salem Mohamed',
    ),
  ),
  TableModel(id: 11, isReserved: false, user: null),
  TableModel(id: 12, isReserved: false, user: null),
  TableModel(id: 13, isReserved: false, user: null),
  TableModel(id: 14, isReserved: false, user: null),
  TableModel(id: 15, isReserved: false, user: null),
  TableModel(id: 16, isReserved: false, user: null),
  TableModel(id: 17, isReserved: false, user: null),
  TableModel(id: 18, isReserved: false, user: null),
];
