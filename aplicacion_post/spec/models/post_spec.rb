require 'spec_helper'

describe Post do
	it { should have_many(:comentario_post)}
end
