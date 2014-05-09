describe Email do
  it "should strip emails!" do
    body = "Hello\n--\n Philippe"
    expect(Email.new(body: body).stripped_body).to eq "Hello"
  end
  it "should strip emails!" do
    body = "Hello\n\n\nOn Fri, May 9, 2014 at 3:19 PM, Roundup Roger <\nroger@rounduproger.brewhouse.io> wrote:\n\n> Philippe Creux And here is some content!\n>\n\n
"
    expect(Email.new(body: body).stripped_body).to eq "Hello"
  end
end
