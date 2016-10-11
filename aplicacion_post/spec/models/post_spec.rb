require 'spec_helper'

describe Post do
	it { should have_many(:comentarios_post)}
end
