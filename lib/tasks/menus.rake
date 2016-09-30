namespace :db do
  task seed: :environment do
    make_menu
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
      url: '/tags',
      name: '标签管理'
  )
  Menu.create(
      id: 3,
      parent_id:1,
      url: '/menus',
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
      name: '欧美'
  )
  Menu.create(
      id: 7,
      parent_id: 4,
      url: '',
      name: '日韩'
  )
  Menu.create(
      id: 8,
      url: '',
      name: '关于火星'
  )
end