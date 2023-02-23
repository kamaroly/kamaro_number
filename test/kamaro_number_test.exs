defmodule KamaroNumberTest do
  use ExUnit.Case

  alias KamaroNumber

  describe "Testing number conversion to words" do
    test "100 converts to one hundred" do
      assert KamaroNumber.convert(100) == "one hundred"
    end

    test "100.5 converts to one hundred point five" do
      assert KamaroNumber.convert(100.5) == "one hundred point five"
    end

    test "4.9 converts to four point nine" do
      assert KamaroNumber.convert(4.9) == "four point nine"
    end

    test "21.7 converts to twenty one point seven" do
      assert KamaroNumber.convert(21.7) == "twenty-one point seven"
    end

    test "1000 converts to one thousand" do
      assert KamaroNumber.convert(1000) == "one thousand"
    end

    test "10000 converts to one thousand" do
      assert KamaroNumber.convert(10000) == "ten thousand"
    end

    test "100000 converts to one hundred thousand" do
      assert KamaroNumber.convert(100_000) == "one hundred thousand"
    end

    test "1000000 converts to one million" do
      assert KamaroNumber.convert(1_000_000) == "one million"
    end

    test "1000023 converts to one million and twenty-three" do
      assert KamaroNumber.convert(1_000_023) == "one million and twenty-three"
    end

    test "1000000000000000000 converts to one quintillion" do
      assert KamaroNumber.convert(1_000_000_000_000_000_000) == "one quintillion"
    end
  end
end
