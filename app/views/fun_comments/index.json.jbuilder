json.array!(@fun_comments) do |fun_comment|
  json.extract! fun_comment, :id, :author_no, :name, :body, :deleted
  json.url fun_comment_url(fun_comment, format: :json)
end
