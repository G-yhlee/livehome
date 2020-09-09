defmodule ServerWeb.Test do
  def test_1 do
    """
    입출력 예 #1 문자열을 1개 단위로 잘라 압축했을 때 가장 짧습니다.
    입출력 예 #2 문자열을 8개 단위로 잘라 압축했을 때 가장 짧습니다.
    입출력 예 #3 문자열을 3개 단위로 잘라 압축했을 때 가장 짧습니다.
    입출력 예 #4 문자열을 2개 단위로 자르면 “abcabcabcabc6de” 가 됩니다. 문자열을 3개 단위로 자르면 “4abcdededededede” 가 됩니다. 문자열을 4개 단위로 자르면 “abcabcabcabc3dede” 가 됩니다. 문자열을 6개 단위로 자를 경우 “2abcabc2dedede”가 되며, 이때의 길이가 14로 가장 짧습니다.
    입출력 예 #5 문자열은 제일 앞부터 정해진 길이만큼 잘라야 합니다. 따라서 주어진 문자열을 x / ababcdcd / ababcdcd 로 자르는 것은 불가능 합니다. 이 경우 어떻게 문자열을 잘라도 압축되지 않으므로 가장 짧은 길이는 17이 됩니다.
    """
  end

  def solution(s) do
  end

end
