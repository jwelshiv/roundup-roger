describe Email do
  it "should strip emails!" do
    body = "Hello\n--\n Philippe"
    expect(Email.new(body: body).stripped_body).to eq "Hello"
  end

  it "should strip emails!" do
    body = "Hello\n\n\nOn Fri, May 9, 2014 at 3:19 PM, Roundup Roger <\nroger@rounduproger.brewhouse.io> wrote:\n\n> Philippe Creux And here is some content!\n>\n\n"
    expect(Email.new(body: body).stripped_body).to eq "Hello"
  end

  it "should also strip this email" do
    body = "Hello\n> On May 28, 2014 at 12:31:44 AM, Roundup Roger (roger@rounduproger.brewhouse.io) wrote:\n> What did you do today?\n> Blah Blah some content."
    expect(Email.new(body: body).stripped_body).to eq "Hello"
  end
end
