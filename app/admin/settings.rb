ActiveAdmin.register_page "Settings" do

  menu priority: 2

  content do
    table class: 'settings' do
      thead do
        th 'Setting'
        th 'Value'
        th ''
      end
      Page.first.to_settings_hash.each do |key, values|
        values.each do |subkey, value|
          form action: admin_settings_update_path, method: :post do |f|
            f.input type: :hidden, name: :authenticity_token, value: form_authenticity_token.to_s
            f.input type: :hidden, name: :key, value: key
            f.input type: :hidden, name: :subkey, value: subkey
            tr do
              td strong "#{key}.#{subkey}"
              td do
                if subkey == 'timezone'
                  us_zones = ['US & Canada', ActiveSupport::TimeZone::us_zones.map(&:name)]
                  other_zones = ['Worldwide', ActiveSupport::TimeZone::all.map(&:name) - us_zones[1]]
                  select_tag :value, grouped_options_for_select([us_zones, other_zones], value)
                elsif subkey == 'user_can_set_self'
                  select_tag :value, options_for_select([true, false], value)
                else
                  f.input name: :value, value: value, size: 75
                end
              end
              td f.input type: 'submit', value: 'Update'
            end
          end
        end
      end
    end
  end


  page_action :update, method: :post do
    Page.first.settings(params[:key].to_sym).update_attributes params[:subkey].to_sym => params[:value]
    redirect_to :back, notice: "#{params[:key]}.#{params[:subkey]} updated"
  end

end
