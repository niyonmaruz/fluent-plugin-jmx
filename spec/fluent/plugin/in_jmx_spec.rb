# coding: utf-8
BASE_CONFIG = %(
  type jmx
  tag hoge
)

CONFIG = BASE_CONFIG + %(
  interval 1
)

describe Fluent::JmxInput do
  before do
    Fluent::Test.setup
  end

  describe '#configure' do
    let(:d) do
      Fluent::Test::InputTestDriver.new(Fluent::JmxInput)
    end

    context 'テストのテスト' do
      it 'configが取得できること' do
        instance = d.configure(CONFIG).instance
        expect(instance.interval).to eq 1
      end
    end

  end

  describe '#run' do
    let(:d) do
      Fluent::Test::InputTestDriver.new(Fluent::JmxInput)
        .configure(config)
    end

    before do
    end

    describe 'interval確認' do
      before do
      end
      context 'intervalが1秒の場合' do
        let(:config) { BASE_CONFIG + 'interval 1' }

        it '2秒間にexecuteを2回コールすること。' do
          expect(d.instance).to receive(:execute).exactly(2)
          d.run { sleep 2.0 }
        end
      end

      context 'intervalが2秒の場合' do
        let(:config) { BASE_CONFIG + 'interval 2' }
        it '2秒間にexecuteを1回コールすること。' do
          expect(d.instance).to receive(:execute).exactly(1)
          d.run { sleep 2.0 }
        end
      end
    end

  end
end
