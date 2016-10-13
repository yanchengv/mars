namespace :db do
  task seed: :environment do
    #make_menu
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
      name: '日韩'
  )

  Menu.create(
      id: 9,
      parent_id: 4,
      url: '',
      name: '欧美'
  )
  Menu.create(
      id: 10,
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

  # 电影类型标签
  Tag.create(
      id:1 ,
      name: '动作',
      tag_type: 'tag',
      sort: 1
  )
  Tag.create(
      id:2 ,
      name: '灾难',
      tag_type: 'tag',
      sort: 2
  )
  Tag.create(
      id:3 ,
      name: '犯罪',
      tag_type: 'tag',
      sort: 3
  )
  Tag.create(
      id:4 ,
      name: '恐怖',
      tag_type: 'tag',
      sort: 4
  )
  Tag.create(
      id:5 ,
      name: '悬疑',
      tag_type: 'tag',
      sort: 5
  )
  Tag.create(
      id:6 ,
      name: '励志',
      tag_type: 'tag',
      sort: 6
  )
  Tag.create(
      id:7 ,
      name: '武侠',
      tag_type: 'tag',
      sort: 7
  )
  Tag.create(
      id:8 ,
      name: '喜剧',
      tag_type: 'tag',
      sort: 8
  )
  Tag.create(
      id:9 ,
      name: '穿越',
      tag_type: 'tag',
      sort: 9
  )
  Tag.create(
      id:10 ,
      name: '丧尸',
      tag_type: 'tag',
      sort: 10
  )

  Tag.create(
      id:11 ,
      name: '魔幻',
      tag_type: 'tag',
      sort: 11
  )
  Tag.create(
      id:12 ,
      name: '剧情',
      tag_type: 'tag',
      sort: 12
  )
  Tag.create(
      id:13 ,
      name: '历史',
      tag_type: 'tag',
      sort: 13
  )
  Tag.create(
      id:14 ,
      name: '军事',
      tag_type: 'tag',
      sort: 14
  )
  Tag.create(
      id:15 ,
      name: '奇幻',
      tag_type: 'tag',
      sort: 15
  )
  Tag.create(
      id:16 ,
      name: '伦理',
      tag_type: 'tag',
      sort: 16
  )
  Tag.create(
      id:17 ,
      name: '传纪',
      tag_type: 'tag',
      sort: 17
  )
  Tag.create(
      id:18 ,
      name: '古装',
      tag_type: 'tag',
      sort: 18
  )

  Tag.create(
      id:19 ,
      name: '西部',
      tag_type: 'tag',
      sort: 19
  )
  Tag.create(
      id:20 ,
      name: '运动',
      tag_type: 'tag',
      sort: 20
  )
  Tag.create(
      id:21 ,
      name: '家庭',
      tag_type: 'tag',
      sort: 21
  )
  Tag.create(
      id:22 ,
      name: '歌舞',
      tag_type: 'tag',
      sort: 22
  )
  Tag.create(
      id:23 ,
      name: '纪录片',
      tag_type: 'tag',
      sort: 23
  )
  Tag.create(
      id:24 ,
      name: '动画',
      tag_type: 'tag',
      sort: 24
  )
  Tag.create(
      id:25 ,
      name: '儿童',
      tag_type: 'tag',
      sort: 25
  )
  Tag.create(
      id:26 ,
      name: '短片',
      tag_type: 'tag',
      sort: 26
  )
  Tag.create(
      id:27 ,
      name: '微电影',
      tag_type: 'tag',
      sort: 27
  )
  Tag.create(
      id:28 ,
      name: '音乐',
      tag_type: 'tag',
      sort: 28
  )
  Tag.create(
      id:29 ,
      name: '同性',
      tag_type: 'tag',
      sort: 29
  )
  Tag.create(
      id:30 ,
      name: '全部',
      tag_type: 'tag',
      sort: 0
  )



  # 区域
  Tag.create(
      id:31 ,
      name: '大陆',
      tag_type: 'region',
      sort: 1
  )
  Tag.create(
      id:32 ,
      name: '香港',
      tag_type: 'region',
      sort: 2
  )
  Tag.create(
      id:33 ,
      name: '台湾',
      tag_type: 'region',
      sort: 3
  )
  Tag.create(
      id:34 ,
      name: '日韩',
      tag_type: 'region',
      sort: 4
  )
  Tag.create(
      id:35 ,
      name: '欧美',
      tag_type: 'region',
      sort: 5
  )
  Tag.create(
      id:36 ,
      name: '其它',
      tag_type: 'region',
      sort: 6
  )
  Tag.create(
      id:37 ,
      name: '全部',
      tag_type: 'region',
      sort: 0
  )


#   电视类型
  Tag.create(
      id:38 ,
      name: '全部',
      tag_type: 'type',
      sort: 0
  )
  Tag.create(
      id:39 ,
      name: '电影',
      tag_type: 'type',
      sort: 1
  )
  Tag.create(
      id:40 ,
      name: '电视剧',
      tag_type: 'type',
      sort: 2
  )
  Tag.create(
      id:41 ,
      name: '动画片',
      tag_type: 'type',
      sort: 3
  )
  Tag.create(
      id:42 ,
      name: '综艺片',
      tag_type: 'type',
      sort: 4
  )
  Tag.create(
      id:43 ,
      name: '影视预告',
      tag_type: 'type',
      sort: 5
  )
  Tag.create(
      id:44 ,
      name: 'IT技术',
      tag_type: 'type',
      sort: 6
  )
end