alias TuningPerformance.Blog

Blog.create_post(%{
  title: "post",
  views: 0
})

1..120000
|> Enum.to_list()
|> Enum.each(fn n ->
  Blog.create_tag(%{
    post_id: 1,
    name: "seed"
  })
end)
