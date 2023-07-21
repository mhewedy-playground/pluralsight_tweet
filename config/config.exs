use Mix.Config

config :pluralsight_tweet, PluralsightTweet.Scheduler,
  jobs: [
    {"* * * *",
     fn ->
       Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
       |> PluralsightTweet.FileReader.get_strings_to_tweet()
       |> PluralsightTweet.TweetServer.tweet()
     end}
  ]
