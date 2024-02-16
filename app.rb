require 'matrix'

# タグの種類とユーザー数を定義
num_tags = 50
num_users = 100

# ユーザーごとにランダムなタグデータを生成（0か1の値を持つ）
user_tags = Array.new(num_users) { Array.new(num_tags) { rand(0..1) } }

user_tags_matrix = Matrix[*user_tags]

def cosine_similarity(vector1, vector2)
  dot_product = vector1.inner_product(vector2)
  magnitude1 = Math.sqrt(vector1.inner_product(vector1))
  magnitude2 = Math.sqrt(vector2.inner_product(vector2))
  dot_product / (magnitude1 * magnitude2)
end

current_user_tags = user_tags_matrix.row(0) # 例として1行目をカレントユーザーとする

similarities = user_tags_matrix.row_vectors.map do |user_tags|
  cosine_similarity(current_user_tags, user_tags)
end

# 類似度が高い順にユーザーをソートし、上位10名を取得
similar_users = similarities.each_with_index.sort_by { |similarity, index| -similarity }
top_10_similar_users = similar_users.first(10).map { |similarity, index| index }


puts similar_users
puts top_10_similar_users

