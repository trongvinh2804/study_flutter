import 'package:flutter/material.dart';

class QuanLyNhanSu extends StatefulWidget {
  final String title;

  const QuanLyNhanSu({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _QuanLyNhanSu();
}

class _QuanLyNhanSu extends State<QuanLyNhanSu> {
  final List<NhanSu> _nhanSus = [
    NhanSu(image: Icons.person, soThich: "Đọc sách", hocVan: "Đại học"),
    NhanSu(image: Icons.person, soThich: "Du lịch", hocVan: "Cao đẳng"),
    NhanSu(image: Icons.person, soThich: "Chơi thể thao", hocVan: "Trung cấp"),
    NhanSu(image: Icons.person, soThich: "Đọc sách", hocVan: "Đại học"),
    NhanSu(image: Icons.person, soThich: "Du lịch", hocVan: "Cao đẳng"),
    NhanSu(image: Icons.person, soThich: "Chơi thể thao", hocVan: "Trung cấp"),
  ];
  String? _selectedBangCap = "Khong";

  bool _soThich1 = false;
  bool _soThich2 = false;

  void _onBangCapChanged(String? value) {
    setState(() {
      _selectedBangCap = value;
    });
  }

  void _onSoThich1Changed(bool? value) {
    setState(() {
      _soThich1 = value ?? false;
    });
  }

  void _onSoThich2Changed(bool? value) {
    setState(() {
      _soThich2 = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(flex: 5, child: header()),
            Expanded(flex: 5, child: listview()),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Center(
      child: Column(
        children: [
          // TextField nhập tên
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: TextField(
              decoration: const InputDecoration(
                label: Text("Nhập tên"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              const Expanded(flex: 1, child: Text("Bằng cấp")),
              Expanded(
                flex: 1,
                child: Radio(
                  value: "DH",
                  groupValue: _selectedBangCap,
                  onChanged: _onBangCapChanged,
                ),
              ),
              const Expanded(flex: 1, child: Text("Đại học")),
              Expanded(
                flex: 1,
                child: Radio(
                  value: "CD",
                  groupValue: _selectedBangCap,
                  onChanged: _onBangCapChanged,
                ),
              ),
              const Expanded(flex: 1, child: Text("Cao đẳng")),
              Expanded(
                flex: 1,
                child: Radio(
                  value: "TC",
                  groupValue: _selectedBangCap,
                  onChanged: _onBangCapChanged,
                ),
              ),
              const Expanded(flex: 1, child: Text("Trung cấp")),
            ],
          ),

          // Checkbox cho sở thích
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              children: [
                const Expanded(flex: 1, child: Text("Sở thích")),
                Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: _soThich1,
                    onChanged: _onSoThich1Changed,
                  ),
                ),
                const Expanded(flex: 1, child: Text("Đọc")),
                Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: _soThich2,
                    onChanged: _onSoThich2Changed,
                  ),
                ),
                const Expanded(flex: 1, child: Text("Du lịch")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              decoration: const InputDecoration(
                label: Text("Sở thích khác"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listview() {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          fillOverscroll: true,
          child: ListView.builder(
            itemCount: _nhanSus.length,
            itemBuilder: (context, position) {
              return listItem(_nhanSus[position]);
            },
          ),
        ),
      ],
    );
  }

  Widget listItem(NhanSu nhanSu) {
    String hocVan = nhanSu.hocVan;
    String soThich = nhanSu.soThich;
    TextEditingController ketQuaHV = TextEditingController();
    ketQuaHV.text = hocVan;
    TextEditingController ketQuaST = TextEditingController();
    ketQuaST.text = soThich;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Icon(Icons.people, size: 60),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: TextField(
                      readOnly: true,
                      controller: ketQuaHV,
                      decoration: InputDecoration(
                        label: Text("Học vấn"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextField(
                    readOnly: true,
                    controller: ketQuaST,
                    decoration: InputDecoration(
                      label: Text("Sở thích"),
                      border: OutlineInputBorder(),
                    ),
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

class NhanSu {
  IconData image;
  String soThich;
  String hocVan;

  NhanSu({required this.image, required this.soThich, required this.hocVan});
}
