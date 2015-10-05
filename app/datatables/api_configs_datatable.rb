class ApiConfigsDatatable
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: ApiConfig.count,
        iTotalDisplayRecords: api_configs.total_entries,
        aaData: data
    }
  end

  private

  def data
    api_configs.map do |api_conf|
      [
          link_to(api_conf.name, api_conf),
          api_conf.key,
          api_conf.secret,
          api_conf.token,
          api_conf.token_secret,
          # h(api_conf.released_on.strftime("%B %e, %Y")),
          # number_to_currency(api_conf.price)
      ]
    end
  end

  def api_configs
    @configs ||= fetch_configs
  end

  def fetch_configs
    api_configs = ApiConfig.order("#{sort_column} #{sort_direction}")
    api_configs = api_configs.page(page).per_page(per_page)
    if params[:sSearch].present?
      api_configs = api_configs.where("name like :search", search: "%#{params[:sSearch]}%")
    end
    api_configs
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name id secret token token_secret]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end