require 'fibonacci/naive'

require 'fibonacci/cached'
module Fibonacci
  module Cached
    RSpec.describe Cached do
      it { expect(described_class::Numbers.new.at(0)).to eq Naive.fibonacci(0) }
      it { expect(described_class::Numbers.new.at(1)).to eq Naive.fibonacci(1) }
      it { expect(described_class::Numbers.new.at(2)).to eq Naive.fibonacci(2) }
      it { expect(described_class::Numbers.new.at(3)).to eq Naive.fibonacci(3) }
      it { expect(described_class::Numbers.new.at(4)).to eq Naive.fibonacci(4) }
      it { expect(described_class::Numbers.new.at(5)).to eq Naive.fibonacci(5) }
    end
  end
end
