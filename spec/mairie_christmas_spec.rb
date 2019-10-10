require_relative '../lib/mairie_christmas'

describe "get_townhall_email method" do
  it "get the email of Avernes townhall" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/lassy.html")).to eq("unknown")
  end
end

describe "make_hash method" do
  it "build a hash" do
    s = ["a", "b"]
    s2 = ["c", "d"]
    expect(make_hash(s, s2)).to eq([{"a"=>"c"}, {"b"=>"d"}])
  end
end
