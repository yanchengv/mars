namespace :db do
  task seed: :environment do
    make_menu
  end
end

def make_menu
  Menu.delete_all
  Menu.create(
      id: 1,
      name: '管理'
  )
  Menu.create(
      id: 2,
      parent_id:1,
      name: '标签管理'
  )
  Menu.create(
      id: 3,
      parent_id:1,
      name: '菜单管理'
  )
  Menu.create(
      id: 4,
      name: '电影'
  )
  Menu.create(
      id: 5,
      parent_id: 4,
      name: '大陆'
  )
  Menu.create(
      id: 6,
      parent_id: 4,
      name: '欧美'
  )
  Menu.create(
      id: 7,
      parent_id: 4,
      name: '日韩'
  )
  Menu.create(
      id: 8,
      name: '关于火星'
  )
end