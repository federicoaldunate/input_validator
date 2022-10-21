
require_relative "challenge"

RSpec.describe Challenge do
  subject { described_class }

  describe "#program" do
    context "when the input is correct" do
      let(:input) {"1234WORK1234"}
      it "do work" do
        expect(subject.new(input).program).to eq("Input: 1234WORK1234")
      end

      it "does not raise any error" do
        expect {
          subject.new(input).program
        }.not_to raise_error
      end
    end
    context "when size is longer than the limit" do
      let(:input) { "abcdABCD12345678910"}

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The length of the input must be between 10 and 15 characters")
      end
    end

    context "when size is below the limit" do
      let(:input) { "ABCD120"}

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The length of the input must be between 10 and 15 characters")
      end
    end

    context "when the input does not include enough numbers" do
      let(:input) { "ABCDabcdefgh12"}

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The input must include at least 3 numbers")
      end
    end

    context "when the input does not include enough uppercase letters" do
      let(:input) { "abcd123ABCabf12"}

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The input must include at least 4 uppercase letters")
      end
    end

    context "when the size is below the limit and it does not have enought uppercase letters" do
      let(:input) { "1233AB"}

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The length of the input must be between 10 and 15 characters,The input must include at least 4 uppercase letters")
      end
    end

    context "when the input is an empty string" do
      let(:input) { "" }

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "The length of the input must be between 10 and 15 characters,The input must include at least 3 numbers,The input must include at least 4 uppercase letters")
      end
    end

    context "with nil" do
      let(:input) { nil }

      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "Input is not a string")
      end
    end

    context "with a number" do
      let(:input) { 912 }
      
      it "returns an error" do
        expect {
          subject.new(input).program
        }.to raise_error(StandardError, "Input is not a string")
      end
    end
  end
end