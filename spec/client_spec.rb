require('spec_helper')


describe(Client) do

  describe(".all") do
    it("is empty at first") do
     expect(Client.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a client by its ID number") do
      client1 = Client.new({:client_name => "Michael", :id => nil, :stylist_id => 1})
      client1.save()
      client2 = Client.new({:client_name => "Crystal", :id => nil, :stylist_id => 1})
      client2.save()
      expect(Client.find(client1.id())).to(eq(client1))
    end
  end

  describe("#save") do
    it("pushes the client name into the clients array") do
      test_client = Client.new({:client_name => "Crystal", :id => nil, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client name") do
      test_client1 = Client.new({:client_name => "Crystal", :id => nil, :stylist_id => 1})
      test_client2 = Client.new({:client_name => "Crystal", :id => nil, :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end
end
