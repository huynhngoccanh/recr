class Athlete::Search
  attr_reader :params, :q

  def initialize(params)
    @params = params
  end

  def search
    Athlete.search(query, options)
  end

  def query
    params.dig(:q).present? ? params[:q] : "*"
  end

  def options
    options ||= {}
    options.deep_merge!({fields: [:name], match: :word_start})
    options.deep_merge!({page: params.fetch(:page, 1)})
    options.deep_merge!({per_page: 12})
    options.deep_merge!({order: {updated_at: :desc}})
    options.deep_merge!({where: {primary_position: params[:positions]}}) if params.has_key?(:positions) && params[:positions].present?
    options.deep_merge!({where: { state:     params[:state]}})     if params.has_key?(:state) && params[:state].present?
    options.deep_merge!({where: { class_of:     params[:class_of]}})     if params.has_key?(:class_of) && params[:class_of].present?
    options.deep_merge!({where: {gpa: {gte: params[:gpa]}}}) if params.has_key?(:gpa) && params[:gpa].present?
    options
  end
end
