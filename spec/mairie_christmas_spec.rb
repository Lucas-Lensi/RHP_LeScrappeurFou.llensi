require_relative '../lib/mairie_christmas'

describe "get_townhall_email method" do
  it "get the email of Avernes townhall" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/lassy.html")).to eq("unknown")
  end
end

describe "get_townhall_urls method" do
  it "get the url of each townhall" do
    expect(get_townhall_urls)
  end
end
