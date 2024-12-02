import 'package:blog/ui/pages/home/widget/home_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOG'),
      ),
      // 6. Scaffold body 영역의 색상
      backgroundColor: Colors.grey[200],
      // 7. 패딩 적용
      body: Padding(
        padding: EdgeInsets.all(20),
        // 1. 레이아웃 배치
        child: Column(
          // 5. Expanded를 배치하면 Column의 크기는 정해지기 때문에
          //    CrossAxisAlignment 설정해주기!
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. 텍스트 배치
            Text(
              '최근 글',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
           HomeListView()
          ],
        ),
      ),
    );
  }
}
