require 'in_memory_cache'
require 'pry'

describe InMemoryCache do

  before do
    @cache = InMemoryCache.new
  end

  describe '#set' do
    context 'add to in memory cache' do
      it 'adds new key/value to cache' do
        report = @cache.set 'sky', 'clear'

        expect(report).to eq 'clear'
      end
    end
  end

  describe '#get' do
    context 'dependent on #set / gets value from cache' do
      it 'does NOT find value in cache' do
        request = @cache.get('sky')

        expect(request.nil?).to eq true
      end
    end

    context 'add to in memory cache' do
      it 'finds value in cache' do
        report = @cache.set 'sky', 'clear'
        request = @cache.get('sky')

        expect(request).to eq 'clear'
      end
    end
  end

  describe '#key?' do
    context 'dependent on #set / checks value in cache' do
      it 'does NOT find value in cache' do
        request = @cache.key?('sky')

        expect(request).to eq false
      end
    end

    context 'dependent on #set / checks value in cache' do
      it 'DOES find value in cache' do
        @cache.set 'sky', 'clear'
        request = @cache.key?('sky')

        expect(request).to eq true
      end
    end
  end

  describe '#clear' do
    context 'dependent on #set / clears cache' do
      it 'deletes keys/values in cache' do
        @cache.set 'sky', 'clear'
        reset_cache = @cache.clear

        expect(reset_cache.empty?).to eq true
      end
    end
  end
end
