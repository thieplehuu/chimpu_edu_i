import 'package:chimpu_edu_i/data/model/children.dart';
import 'package:chimpu_edu_i/data/model/parents.dart';
import 'package:chimpu_edu_i/data/model/picnic.dart';
import 'package:intl/intl.dart';
import 'package:chimpu_edu_i/data/model/teacher.dart';

final user = new Teacher(
  id: 1,
  email: 'thieplehuugt@gmail.com',
  name: 'Le Huu Thiep',
  address: 'Khối 12 TP Vinh - Nghệ An',
  avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
  birth: DateFormat("yyyy-MM-dd").parse('2000-07-19'),
);


final List<Children> childrens = [
  Children(
    id: 1,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 2,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  ),Children(
    id: 3,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 4,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  ),
  Children(
    id: 5,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 6,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  ),
  Children(
    id: 7,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 8,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  ),
  Children(
    id: 9,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 10,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  ),
  Children(
    id: 11,
    name: 'Nguyễn Lê Hiền Minh',
    parents: Parents(
      name: 'Lê Thị Hoài Linh',
      email: 'hoailinh@gmail.com',
      mobile: '0902234435',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-140338LAKL7A9ZL3.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2017-07-19'),
  ),
  Children(
    id: 12,
    name: 'Đàm Lê Bảo Anh',
    parents: Parents(
      name: 'Lê Thị Trang',
      email: 'trang@gmail.com',
      mobile: '0902234468',
      avatarUrl: 'http://hinhnendethuong.com/uploads/ctv_5/FILE-20170210-1404U58PXJ9NVFS5.jpg',
      address: 'Đông Vĩnh TP Vinh - Nghệ An'
    ),  
    avatarUrl: 'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    images: [
      'https://images-na.ssl-images-amazon.com/images/I/61hdGYayXUL._AC_UX679_.jpg',
    ],
    birth: DateFormat("yyyy-MM-dd").parse('2016-07-19'),
  )
];

final Map picnics = {
  DateTime(2020, 2, 18): [
    {
      'name': 'Tham quan công viên thỏ trắng', 
      'isDone': false,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 3, 19): [
    {
      'name': 'Tham quan vườn bách thú', 
      'isDone': false,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 4, 20): [
    {
      'name': 'Event A', 
      'isDone': false,
      'id': 1,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 1, 20): [
    {
      'name': 'Event A', 
      'isDone': false,
      'id': 2,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 1, 21): [
    {
      'name': 'Event A', 
      'isDone': false,
      'id': 3,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 1, 23): [
    {
      'name': 'Event A', 
      'isDone': false,
      'id': 4,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ],
  DateTime(2020, 1, 25): [
    {
      'name': 'Event A', 
      'isDone': false,
      'id': 5,
      'thumbnail_url': 'http://giaitrithotrang.vn/wp-content/uploads/2016/08/Du-quay-day-vang.png',
      'description': 'Các bé sẽ tham quan công viên thỏ trắng, hoạt động ngoài trời, chơi các trò chơi vận động',
      'address': 'Công viên thỏ trắng-520 CMT8'
    },
  ]
};