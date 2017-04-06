defmodule Store.ArticleControllerTest do
  use Store.ConnCase

  alias Store.Article

  test "lists all entries on index", %{conn: conn} do
    Repo.insert! %Article{name: "Ex Iure Error Rem", body: "Saepe hic ad maxime dolorem et optio. Quis libero deleniti sed error illum atque qui. Quia fuga debitis explicabo. Quis asperiores molestias. Qui nesciunt nulla accusamus facere dolore et vero. Nihil assumenda deleniti natus rerum et. Aut labore commodi accusamus sunt quis.", authors: "Daphnee Boyle Jr., Louie Boyer, Franz D'Amore", genres: "Realistic fiction, Fiction in verse"}
    conn = get conn, article_path(conn, :index)
    response_text = html_response(conn, 200)
    assert response_text =~ "Listing articles"
    assert response_text =~ "Ex Iure Error Rem"
    assert response_text =~ "Saepe hic ad maxime dolorem et optio. Quis libero deleniti sed error illum atque qui. Quia fuga debitis explicabo. Quis asperiores molestias. Qui nesciunt nulla accusamus facere dolore et vero. Nihil assumenda deleniti natus rerum et. Aut labore commodi accusamus sunt quis."
    assert response_text =~ "Daphnee Boyle Jr., Louie Boyer, Franz D&#39;Amore"
    assert response_text =~ "Realistic fiction, Fiction in verse"
  end
end
