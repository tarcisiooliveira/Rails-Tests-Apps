# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create Customer' do
    subject.name = 'Tarcisio Oliveira'
    subject.email = 'tarcisio@email.com'
    subject.save

    expect(subject.name).to eq('Tarcisio Oliveira')
    expect(subject.full_name).to eq('Sr. Tarcisio Oliveira')
  end
end

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Create Customer with fixture Tarcisio' do
    usuario = customers(:tarcisio)

    expect(usuario.name).to eq('Tarcisio Oliveira')
    expect(usuario.full_name).to eq('Sr. Tarcisio Oliveira')
  end

  it 'Create Customer with fixture Fulano' do
    usuario = customers(:fulano)

    expect(usuario.name).to eq('Fulano da Silva')
    expect(usuario.full_name).to eq('Sr. Fulano da Silva')
  end
end
