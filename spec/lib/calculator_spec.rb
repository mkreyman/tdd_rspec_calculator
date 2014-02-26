require 'rspec'
require './lib/calculator'

describe Calculator do
  describe ".total" do
    it "should be 0 on a new calculator" do
      expect(subject.total).to eq(0)
    end
  end

  describe ".add" do
    it "should add a number to the total" do
      subject.add(5)
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to add" do
      subject.add(5).add(2)
      expect(subject.total).to eq(7)
    end

    it "should handle negative numbers" do
      subject.add(-2)
      expect(subject.total).to eq(-2)

      subject.add(5).add(-27).add(10).add(-12)
      expect(subject.total).to eq(-26)
    end

    it "should handle floats" do
      subject.add(2.5)
      expect(subject.total).to eq(2.5)

      subject.add(-3.1).add(4.5).add(-31.257)
      expect(subject.total).to be_within(0.0001).of(-27.357)
    end

    # add(5).add(2)
    # add(5,2)
  end

  describe ".subtract" do
    it "should subtract a number from the total" do
      subject.add(10)
      subject.subtract(5)
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to subtract" do
      subject.add(10)
      subject.subtract(5).subtract(2)
      expect(subject.total).to eq(3)
    end

    it "should handle negative numbers" do
      subject.subtract(-2)
      expect(subject.total).to eq(2)

      subject.subtract(5).subtract(-27).subtract(10).subtract(-12)
      expect(subject.total).to eq(26)
    end

    it "should handle floats" do
      subject.add(5)
      subject.subtract(2.5)
      expect(subject.total).to eq(2.5)

      subject.subtract(-3.1).subtract(9.5).subtract(-31.257)
      expect(subject.total).to be_within(0.0001).of(27.357)
    end
  end

   describe ".multiply" do
     it "should multiply the total by a number" do
       subject.add(10)
       subject.multiply(5)
       expect(subject.total).to eq(50)
     end

     it "should handle multiple calls to multiply" do
       subject.add(10)
       subject.multiply(5).multiply(2)
       expect(subject.total).to eq(100)
     end

     it "should handle negative numbers" do
       subject.add(1)
       subject.multiply(-5)
       expect(subject.total).to eq(-5)

       subject.multiply(2).multiply(-3).multiply(10).multiply(-2)
       expect(subject.total).to eq(-600)
     end

     it "should handle floats" do
       subject.add(3)
       subject.multiply(2.5)
       expect(subject.total).to eq(7.5)

       subject.multiply(-3.1).multiply(9.5).multiply(-1.257)
       expect(subject.total).to be_within(0.0001).of(277.6398)
     end
   end

  describe ".divide" do
    it "should divide the total by a number" do
      subject.add(10)
      subject.divide(5)
      expect(subject.total).to eq(2)
    end

    it "should handle multiple calls to divide" do
      subject.add(10)
      subject.divide(5).divide(2)
      expect(subject.total).to eq(1)
    end

    it "should handle negative numbers" do
      subject.add(1000)
      subject.divide(-5)
      expect(subject.total).to eq(-200)

      subject.divide(2).divide(-5).divide(10).divide(-2)
      expect(subject.total).to eq(-1)
    end

    it "should handle floats" do
      subject.add(10)
      subject.divide(2.5)
      expect(subject.total).to eq(4)

      subject.divide(-3.1).divide(9.5).divide(-1.257)
      expect(subject.total).to be_within(0.0001).of(0.108)
    end

    it "should handle zero divided by a number" do
      subject.add(0)
      subject.divide(5)
      expect(subject.total).to eq(0)
    end

    it "should raise error when divided by zero" do
      subject.add(10)
      expect{subject.divide(0)}.to raise_error(ZeroDivisionError)
    end

  end


end