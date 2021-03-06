defmodule PlausibleWeb.StatsView.Test do
  use PlausibleWeb.ConnCase, async: true
  alias PlausibleWeb.StatsView

  describe "large_number_format" do
    test "numbers under 1000 stay the same" do
      assert StatsView.large_number_format(100) == "100"
    end

    test "1000 becomes 1k" do
      assert StatsView.large_number_format(1000) == "1k"
    end

    test "1111 becomes 1.1k" do
      assert StatsView.large_number_format(1111) == "1.1k"
    end

    test "10_000 becomes 10k" do
      assert StatsView.large_number_format(10_000) == "10k"
    end

    test "15_993 becomes 15.9k" do
      assert StatsView.large_number_format(15_923) == "15.9k"
    end

    test "wat" do
      assert StatsView.large_number_format(49012) == "49k"
    end

    test "999_999 becomes 999k" do
      assert StatsView.large_number_format(999_999) == "999k"
    end

    test "1_000_000 becomes 1m" do
      assert StatsView.large_number_format(1_000_000) == "1m"
    end

    test "2_590_000 becomes 2.5m" do
      assert StatsView.large_number_format(2_590_000) == "2.5m"
    end

    test "99_999_999 becomes 99.9m" do
      assert StatsView.large_number_format(99_999_999) == "99.9m"
    end
  end
end
