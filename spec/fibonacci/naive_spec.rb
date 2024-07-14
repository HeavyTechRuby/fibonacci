require 'fibonacci/naive'

module Fibonacci
  module Naive
    RSpec.describe Naive do
      it { expect(described_class.fibonacci(0)).to eq 0 }
      it { expect(described_class.fibonacci(1)).to eq 1 }
      it { expect(described_class.fibonacci(2)).to eq 1 }
      it { expect(described_class.fibonacci(3)).to eq 2 }
      it { expect(described_class.fibonacci(4)).to eq 3 }
      it { expect(described_class.fibonacci(5)).to eq 5 }
    end
  end
end
