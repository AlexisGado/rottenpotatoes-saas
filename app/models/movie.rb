class Movie < ActiveRecord::Base

  def self.all_ratings
    ['G','PG','PG-13','R']
  end

  def self.with_ratings(ratings_hash, sort_column)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies


    if ratings_hash.nil?
      mvs = Movie.all
    else
      mvs = Movie.where(rating: ratings_hash.keys)
    end

    if sort_column == 'release_date'
      mvs.order('release_date DESC')
    elsif sort_column == 'title'
      mvs.order('title')
    else
      mvs
    end


  end
end
