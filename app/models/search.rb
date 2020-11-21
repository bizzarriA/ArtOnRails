class Search < ApplicationRecord

  def self.search(params)
    operas = Opera.all
    operas = operas.where('operas.titolo ILIKE ?', params.titolo) unless params.titolo == 'All'
    operas = operas.where('operas.anno = ?', params.anno) unless params.anno.nil?
    operas = operas.where('operas.tecnica ILIKE ?', params.tecnica) unless params.tecnica == 'All'
    if params.artista == 'All'
      operas
    else
      result = []
      artistas = Artistum.joins('INNER JOIN users ON users.artista_id = artista.id').where('users.nome ILIKE ?', params.artista)
      for artista in artistas
        result << operas.where('operas.artista_id = ?', artista.id)
      end
      result
    end
  end
end
