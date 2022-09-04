import 'package:akm/app/common/style.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PerkiraanNeracaTabel extends StatelessWidget {
  const PerkiraanNeracaTabel({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Perkiraan Neraca'),
      children: [
        SizedBox(
          height: 700,
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 900,
            border: TableBorder.lerp(
              TableBorder.all(color: const Color(0xffE0E0E0), width: 1),
              TableBorder.all(color: const Color(0xffE0E0E0), width: 1),
              0.5,
            ),
            columns: const [
              DataColumn2(
                  label: Text(
                    'AKTIVA',
                    style: subtitle2,
                  ),
                  size: ColumnSize.L),
              DataColumn2(
                label: Text(''),
              ),
              DataColumn2(label: Text(''), size: ColumnSize.L),
              DataColumn2(
                  label: Text(
                    'PASIVA',
                    style: subtitle2,
                  ),
                  size: ColumnSize.L),
            ],
            rows: [
              const DataRow2(
                cells: [
                  DataCell(
                    Text('Aktiva Lancar', style: heading2),
                  ),
                  DataCell(
                    SizedBox.shrink(),
                  ),
                  DataCell(
                    Text('Hutang'),
                  ),
                  DataCell(
                    SizedBox.shrink(),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('1. Kas'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'kas',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text(
                      '1. Hutang Usaha',
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_lancar',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Bank')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(Text('2. Hutang Bank')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_lancar',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('3. Piutang Usaha'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(Text('3. Hutang lainnya')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_lancar',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('4. Persediaan'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              emptyRow(),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('Jumlah Aktiva Lancar'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text('Jumlah Hutang'),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              emptyRow(),
              const DataRow2(
                cells: [
                  DataCell(
                    Text(
                      'Aktiva Tetap',
                      style: heading2,
                    ),
                  ),
                  DataCell(
                    SizedBox.shrink(),
                  ),
                  DataCell(
                    Text(
                      'Hutang',
                      style: heading2,
                    ),
                  ),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              emptyRow(),
              DataRow2(
                cells: [
                  const DataCell(
                    Text('Jumlah Aktiva Tetap'),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text('Jumlah Modal'),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(
                    Text(
                      'JUMLAH AKTIVA',
                      style: subtitle2,
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(
                    Text(
                      'JUMLAH PASIVA',
                      style: subtitle2,
                    ),
                  ),
                  DataCell(
                    FormBuilderTextField(
                      name: 'aktiva_tetap',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  DataRow2 emptyRow() {
    return const DataRow2(
      cells: [
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
        DataCell(SizedBox.shrink()),
      ],
    );
  }
}
