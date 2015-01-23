require('spec_helper')
require('pry')

describe (Stylist) do

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("returns a stylist by its ID number") do
      stylist1 = Stylist.new({:stylist_name => "Daniel", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:stylist_name => "Kara", :id => nil})
      stylist2.save()
      expect(Stylist.find(stylist1.id())).to(eq(stylist1))
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
      test_stylist2 = Stylist.new({:stylist_name => "Daniel", :id => nil})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("it returns the clients array for the stylist") do
      test_stylist = Stylist.new({:stylist_name => "Daniel", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Michael", :stylist_id => test_stylist.id, :id => nil})
      test_client.save()
      expect(test_stylist.clients()).to(eq([test_client]))
    end
  end

end
