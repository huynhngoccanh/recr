class HighSchool::Search
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def search
    search = HighSchool.search(query.downcase, options)
  end

  def query
    params.dig(:q).present? ? params[:q] : "*"
  end

  def options
    options ||= {}
    options.deep_merge!({fields: [:name], match: :word_start })
    options.deep_merge!({per_page: 12})
    options.deep_merge!({page: params.fetch(:page, 1)})
    options.deep_merge!({order: {updated_at: :desc}})
    options.deep_merge!({where: {state: params[:state]}}) if params.has_key?(:state) && params[:state].present?
    options.deep_merge!({where: {enrollment: {lte: params[:enrollment]}}}) if params.has_key?(:enrollment) && params[:enrollment].present?
    options
  end
end
