ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    #

    columns do
      column do
        panel "Highest Gravity Beers" do
          table_for Beer.order("alcohol asc").last(10) do
            column("Name") { |beer| status_tag(beer.name) }
            column("Style") { |beer| beer.style }
            column("Alcohol Percentage (%)")   { |beer| beer.alcohol }
          end
        end
      end
      column do
        panel "Beers Added by Minute" do
          div class: 'beer_chart_style' do
            area_chart Beer.group_by_minute(:created_at).count
          end
        end
      end
    end # columns
    columns do
      column do
        panel "Total Beers by Beer Style" do
          div class: 'beer_chart_style' do
            beer_style = Beer.group(:style).count
            column_chart beer_style
          end
        end
      end
      column do
        panel "Percentage of Beers Tasted" do
          div class: 'beer_chart_alc' do
            pie_chart Beer.group(:seen).count
          end
        end
      end
    end
  end
end
