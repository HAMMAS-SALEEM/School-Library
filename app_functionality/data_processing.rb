module ProcessData
  def fetch_data(file)
    contents = File.read("./data/#{file}.json")
    JSON.parse(contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./data/#{file}.json", json_data)
  end
end
