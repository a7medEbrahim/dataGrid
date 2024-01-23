import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:testapp/core/service/cache_helper.dart';
import 'package:testapp/ui/managers/user_cubit.dart';

import '../../data/model/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String co_code = "1";

    return BlocProvider(
      create: (context) => UserCubit()..getUsers(),
      child: Scaffold(
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SfDataGrid(
              source: UserDataSource(
                user: UserCubit.get(context).users,
              ),
              columns: <GridColumn>[
                GridColumn(
                    columnName: 'id',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'ID',
                        ))),
                GridColumn(
                    columnName: 'name',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('Name'))),
                GridColumn(
                    columnName: 'designation',
                    width: 120,
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('Designation'))),
              ],
            );
          },
        ),
      ),
    );
  }
}

class UserDataSource extends DataGridSource {
  UserDataSource({required List<User> user}) {
    _user = user
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.firstName),
              DataGridCell<String>(columnName: 'lastName', value: e.lastName),
            ]))
        .toList();
  }

  List<DataGridRow> _user = [];

  @override
  List<DataGridRow> get rows => _user;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'id' ||
                dataGridCell.columnName == 'salary')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
