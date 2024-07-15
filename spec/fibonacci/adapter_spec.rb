require 'fibonacci/naive'
require 'fibonacci/adapter'

module Fibonacci
  RSpec.describe Adapter do
    let(:adapter) { described_class.new(name) }

    context 'when naive' do
      let(:name) { :naive }

      it { expect(adapter.fibonacci(0)).to eq Naive.fibonacci(0) }
      it { expect(adapter.fibonacci(1)).to eq Naive.fibonacci(1) }
      it { expect(adapter.fibonacci(2)).to eq Naive.fibonacci(2) }
      it { expect(adapter.fibonacci(3)).to eq Naive.fibonacci(3) }
      it { expect(adapter.fibonacci(4)).to eq Naive.fibonacci(4) }
      it { expect(adapter.fibonacci(5)).to eq Naive.fibonacci(5) }

      it { expect(adapter.take(3)).to eq [0, 1, 1] }
    end

    context 'when fast' do
      let(:name) { :fast }

      it { expect(adapter.fibonacci(0)).to eq Naive.fibonacci(0) }
      it { expect(adapter.fibonacci(1)).to eq Naive.fibonacci(1) }
      it { expect(adapter.fibonacci(2)).to eq Naive.fibonacci(2) }
      it { expect(adapter.fibonacci(3)).to eq Naive.fibonacci(3) }
      it { expect(adapter.fibonacci(4)).to eq Naive.fibonacci(4) }
      it { expect(adapter.fibonacci(5)).to eq Naive.fibonacci(5) }
    end
  end
end
