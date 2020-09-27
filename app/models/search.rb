class Search < ApplicationRecord

  def self.search(params)
    # byebug
    operas = Opera.all
    operas = operas.where('operas.titolo ILIKE ?', params.titolo) unless params.titolo == 'all'
    operas = operas.where('operas.anno = ?', params.anno) unless params.anno.nil?
    operas = operas.where('operas.tecnica ILIKE ?', params.tecnica) unless params.tecnica == 'all'
    # if params[:artista].nil?
    #   operas
    # else
    #   artistas = User.includes('artista').where('users.nome ILIKE ?', params[:artista])
    #   for artista in artistas
    #     result = result+operas.where('opera.artista_id ILIKE ?', artista.artista_id)
    #   end
    #   result
    # end
    operas
  end
end
