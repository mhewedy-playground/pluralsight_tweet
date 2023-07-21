defmodule PluralsightTweet.FileReaderTest do
  import PluralsightTweet.FileReader
  use ExUnit.Case

  test "get tweet from empty content should be empty tweet" do
    tweet = get_tweet("")
    IO.puts("tweet is => #{tweet}")
    assert tweet == ""
  end

  test "get tweet from non-empty content should not be empty tweet" do
    tweet = get_tweet("this is first tweet\nthis is second tweet")
    IO.puts("tweet is => #{tweet}")
    assert String.length(tweet) != 0
  end

end
