import 'package:flutter/material.dart';
import 'package:teacher_app/common/my_drop_down_button.dart';
import 'package:teacher_app/components/part_of_grid.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sections'),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              backgroundBlendMode: BlendMode.colorDodge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(child: Text('Choose Class :')),
                Flexible(
                  flex: 3,
                  child: MyDropDownButton(
                    hintText: 'Type',
                    childText: const ['Option 1', 'Option 2', 'Option 3'],
                    changeValue: () => {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 190,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,
                ),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return const PartOfGrid();
                },
                // children: [
                //   Container(color: Colors.red),
                //   Container(color: Colors.blue),
                //   Container(color: Colors.green),
                //   Container(color: Colors.yellow),
                // ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
