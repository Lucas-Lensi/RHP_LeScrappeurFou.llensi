require_relative "../lib/cher_depute"

describe "name / email method" do
  it "take name" do
    expect(get_depute_name("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719448")).to eq("Mme Annie Chapelier")
    expect(get_depute_name("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721262")).to eq("M. Guillaume Vuilletet")
  end

  it "take email" do
    expect(get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719448")).to eq("annie.chapelier@assemblee-nationale.fr")
    expect(get_depute_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721262")).to eq("guillaume.vuilletet@assemblee-nationale.fr")
  end
end
