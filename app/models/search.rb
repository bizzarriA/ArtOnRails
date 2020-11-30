class Search < ApplicationRecord

  def self.search(params)
    operas = Opera.all
    operas = operas.where('operas.titolo ILIKE ?', params.titolo) unless params.titolo == 'All'
    operas = operas.where('operas.anno = ?', params.anno) unless params.anno.nil?
    operas = operas.where('operas.tecnica ILIKE ?', params.tecnica) unless params.tecnica == 'All'
    if params.artista == 'All'
      return operas
    else
      artistas = Artistum.joins('INNER JOIN users ON users.artista_id = artista.id').where('users.nome ILIKE ? OR users.cognome ILIKE ?', params.artista, params.artista)
      result = operas.where('operas.artista_id = ?', artistas.ids)
      return result
    end
  end
end
