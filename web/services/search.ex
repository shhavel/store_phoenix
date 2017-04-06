defmodule Store.Search do
  import Ecto.Query

  def filter_by_name(query, %{"search" => %{"name" => name}}) when is_binary(name) and name != "" do
    from b in query, where: fragment("similarity(?, ?) > 0.3", b.name, ^name)
  end
  def filter_by_name(query, _) do
    query
  end

  def filter_by_genre(query, %{"search" => %{"genre" => genre}}) when is_binary(genre) and genre != "" do
    from b in query, where: fragment("similarity(?, ?) > 0.3", b.genres, ^genre)
  end
  def filter_by_genre(query, _) do
    query
  end

  def filter_by_author(query, %{"search" => %{"author" => author}}) when is_binary(author) and author != "" do
    from b in query, where: fragment("similarity(?, ?) > 0.3", b.authors, ^author)
  end
  def filter_by_author(query, _) do
    query
  end

  def filter_by_publisher(query, %{"search" => %{"publisher" => publisher}}) when is_binary(publisher) and publisher != "" do
    from b in query, where: fragment("similarity(?, ?) > 0.3", b.publisher, ^publisher)
  end
  def filter_by_publisher(query, _) do
    query
  end
end
