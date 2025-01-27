require 'rails_helper'

RSpec.describe MatchPercentageService do
  describe '.calculate' do
    let(:skills_1) { build_stubbed_list(:skill, 2) }
    let(:skills_2) { skills_1 + [build_stubbed(:skill)] }
    let(:skills_3) { skills_1 + build_stubbed_list(:skill, 2) }
    let(:skills_4) { build_stubbed_list(:skill, 4) }
    let(:skills_5) { build_stubbed_list(:skill, 0) }

    it 'calculates the correct match percentage for partial overlap case 1' do
      expect(MatchPercentageService.calculate(skills_2, skills_1)).to eq(66.67)
    end

    it 'calculates the correct match percentage for partial overlap case 2' do
      expect(MatchPercentageService.calculate(skills_3, skills_1)).to eq(50.00)
    end

    it 'calculates the correct match percentage for no overlap' do
      expect(MatchPercentageService.calculate(skills_4, skills_1)).to eq(0.0)
    end

    it 'calculates the correct match percentage for full overlap' do
      expect(MatchPercentageService.calculate(skills_1, skills_1)).to eq(100.0)
    end

    it 'returns 0 for jobseeker with empty skills list' do
      expect(MatchPercentageService.calculate(skills_1, skills_5)).to eq(0.0)
    end

    it 'returns 100 for job with no required skills' do
      expect(MatchPercentageService.calculate(skills_5, skills_5)).to eq(100.0)
    end
  end
end
