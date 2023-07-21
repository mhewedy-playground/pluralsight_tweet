defmodule PluralsightTweet.FileReader do
  def get_strings_to_tweet(path) do
    File.read!(path) |> get_tweet
  end

  def get_tweet(content) do
    content
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) in 1..140))
    |> Enum.take_random(1)
    |> Enum.at(0, "")
  end
end
