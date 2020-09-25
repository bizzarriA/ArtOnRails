class Search < ApplicationRecord

  def self.search(params)
    operas = Opera.all
    operas = operas.where('opera.nome ILIKE ?', params[:nome])
    operas = operas.where('opera.anno = ?', params[:anno])
    operas = operas.where('opera.tecnica ILIKE ?', params[:tecnica])
    artistas = User.includes('artista').where('users.nome ILIKE ?', params[:artista])
    for artista in artistas
      result = result+operas.where('opera.artista_id ILIKE ?', artista.artista_id)
    end
    result
  end
end
