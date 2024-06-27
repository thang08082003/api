import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Entry '),
                    subtitle: Text('Entry '),
                    trailing: Checkbox(
                      shape: const CircleBorder(),
                      activeColor: Colors.black,
                      value: true,
                      onChanged: (value) => print(value),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    children: [
                      Text('Entry'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Entry')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
