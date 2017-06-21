ActiveAdmin.register Fish do
  permit_params :name

  menu priority: 2
  config.sort_order = "id_asc"
end
