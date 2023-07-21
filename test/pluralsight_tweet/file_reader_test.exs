defmodule PluralsightTweet.FileReaderTest do
  import Mock
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

  test "mocking File module when read! function return empty string" do
    with_mock File, read!: fn _ -> "" end do
      tweet = get_strings_to_tweet("some path I don't care about")

      assert tweet == ""
    end
  end

  test "mocking File module when read! function return non-empty string" do
    with_mock File, read!: fn _ -> "hello" end do
      tweet = get_strings_to_tweet("some path I don't care about")

      assert tweet == "hello"
    end
  end
end
