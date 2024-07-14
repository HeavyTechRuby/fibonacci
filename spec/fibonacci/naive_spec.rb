require 'fibonacci/naive'

module Fibonacci
  module Naive
    RSpec.describe Naive do
      include Naive

      # 0, 1, 1, 2, 3, 5, 8
      it { expect(fibonacci(0)).to eq 0 }
      it { expect(fibonacci(1)).to eq 1 }
      it { expect(fibonacci(2)).to eq 1 }
      it { expect(fibonacci(3)).to eq 2 }
    end
  end
end
