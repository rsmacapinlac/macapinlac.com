require 'sassc'

describe 'SASS variables' do
  it 'compiles the main stylesheet without errors' do
    sass_path = File.expand_path('../../../source/stylesheets/site.css.scss', __FILE__)
    sass_content = File.read(sass_path)
    engine = SassC::Engine.new(sass_content, syntax: :scss, load_paths: [File.dirname(sass_path)])
    expect { engine.render }.not_to raise_error
  end
end 