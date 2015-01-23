require('spec_helper')

describe (Stylist) do

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the stylist name to the salon database") do
      test_stylist = Stylist.new({:stylist_name => "Daniel", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same stylist name") do
      test_stylist1 = Stylist.new({:stylist_name => "Daniel", :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:stylist_name => "Kara", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end
end
