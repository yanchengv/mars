namespace :db do
  task seed: :environment do
    make_menu
    make_tags
  end
end

def make_menu
  Menu.delete_all
  Menu.create(
      id: 1,
      url: '',
      name: '管理'

  )
  Menu.create(
      id: 2,
      parent_id:1,
      url: '/admin_tags',
      name: '标签管理'
  )
  Menu.create(
      id: 3,
      parent_id:1,
      url: '/admin_menus',
      name: '菜单管理'
  )
  Menu.create(
      id: 4,
      url: '',
      name: '电影'
  )
  Menu.create(
      id: 5,
      parent_id: 4,
      url: '',
      name: '大陆'
  )
  Menu.create(
      id: 6,
      parent_id: 4,
      url: '',
      name: '香港'
  )
  Menu.create(
      id: 7,
      parent_id: 4,
      url: '',
      name: '台湾'
  )
  Menu.create(
      id: 8,
      parent_id: 4,
      url: '',
      name: '日本'
  )
  Menu.create(
      id: 9,
      parent_id: 4,
      url: '',
      name: '韩国'
  )
  Menu.create(
      id: 10,
      parent_id: 4,
      url: '',
      name: '欧美'
  )
  Menu.create(
      id: 11,
      parent_id: 4,
      url: '',
      name: '其它'
  )
  Menu.create(
      id: 12,
      url: '',
      name: '关于火星'
  )
end



def make_tags
  Tag.create(
      id:1 ,
      name: '动作'
  )
  Tag.create(
      id:2 ,
      name: '灾难'
  )
  Tag.create(
      id:3 ,
      name: '犯罪'
  )
  Tag.create(
      id:4 ,
      name: '恐怖'
  )
  Tag.create(
      id:5 ,
      name: '悬疑'
  )
  Tag.create(
      id:6 ,
      name: '励志'
  )
  Tag.create(
      id:7 ,
      name: '武侠'
  )
  Tag.create(
      id:8 ,
      name: '喜剧'
  )
  Tag.create(
      id:9 ,
      name: '穿越'
  )
  Tag.create(
      id:10 ,
      name: '丧尸'
  )

  Tag.create(
      id:11 ,
      name: '魔幻'
  )
  Tag.create(
      id:12 ,
      name: '剧情'
  )
  Tag.create(
      id:13 ,
      name: '历史'
  )
  Tag.create(
      id:14 ,
      name: '军事'
  )
  Tag.create(
      id:15 ,
      name: '奇幻'
  )
  Tag.create(
      id:16 ,
      name: '伦理'
  )
  Tag.create(
      id:17 ,
      name: '传纪'
  )
  Tag.create(
      id:18 ,
      name: '古装'
  )

  Tag.create(
      id:19 ,
      name: '西部'
  )
  Tag.create(
      id:20 ,
      name: '运动'
  )
  Tag.create(
      id:21 ,
      name: '家庭'
  )
  Tag.create(
      id:22 ,
      name: '歌舞'
  )
  Tag.create(
      id:23 ,
      name: '纪录片'
  )
  Tag.create(
      id:24 ,
      name: '动画'
  )
  Tag.create(
      id:25 ,
      name: '儿童'
  )
  Tag.create(
      id:26 ,
      name: '短片'
  )
  Tag.create(
      id:27 ,
      name: '微电影'
  )
  Tag.create(
      id:28 ,
      name: '音乐'
  )
  Tag.create(
      id:29 ,
      name: '同性'
  )
end