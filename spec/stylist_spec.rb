require('spec_helper')

describe (Stylist) do

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
