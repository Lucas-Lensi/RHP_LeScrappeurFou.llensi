require_relative '../lib/parseur_fou'

describe "make_hash method" do
  it "create a hash" do
    expect(make_hash(["Bon", "jour", "ca", "va"], [1, 2, 3, 4])).to eq([{"Bon"=>1}, {"jour"=>2}, {"ca"=>3}, {"va"=>4}])
  end
end
