require 'fibonacci/naive'
require 'fibonacci/recursive_without_memoization'

module Fibonacci
  module RecursiveWithoutMemoization
    RSpec.describe RecursiveWithoutMemoization do
      it { expect(described_class.fibonacci(0)).to eq Naive.fibonacci(0) }
      it { expect(described_class.fibonacci(1)).to eq Naive.fibonacci(1) }
      it { expect(described_class.fibonacci(2)).to eq Naive.fibonacci(2) }
      it { expect(described_class.fibonacci(3)).to eq Naive.fibonacci(3) }
      it { expect(described_class.fibonacci(4)).to eq Naive.fibonacci(4) }
      it { expect(described_class.fibonacci(5)).to eq Naive.fibonacci(5) }
    end
  end
end
