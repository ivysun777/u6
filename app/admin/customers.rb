ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), height: '100'
        else
          'No image available'
        end
      end
    end
  end

  index do
    selectable_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image), height: '50'
      else
        'No image'
      end
    end
    actions
  end
end
